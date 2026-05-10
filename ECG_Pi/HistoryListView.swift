import SwiftUI
import FirebaseFirestore
var deviceID: String {
    UserDefaults.standard.string(forKey: "selectedDeviceID") ?? "ECGCARDIA1"
}
struct HistoryListView: View {
    @State private var historyEntries: [HistoryEntry] = []
    @State private var selectedEntryTimestamp: Date? = nil
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    if let selectedTimestamp = selectedEntryTimestamp {
                        Text(selectedTimestamp.formatted(date: .abbreviated, time: .standard))
                            .font(.title3)
                            .bold()
                    } else {
                        Text("History Records")
                            .font(.title2)
                            .bold()
                    }
                        
                        
                    Spacer()
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title)
                            .foregroundColor(.red)
                    }
                }
                .padding(.top, 20)
                .padding(.horizontal)

                NavigationView {
                    List {
                        ForEach(historyEntries) { entry in
                            NavigationLink(
                                destination: HistoryDetailView(entry: entry)
                                    .onAppear {
                                        selectedEntryTimestamp = entry.timestamp
                                    }
                                    .onDisappear {
                                        selectedEntryTimestamp = nil
                                    }
                            ) {
                                VStack(alignment: .leading) {
                                    Text(entry.timestamp?.formatted() ?? "")
                                        .font(.headline)
                                    HStack {
                                        Text("HR: \(Int(entry.heartRate ?? 0))")
                                        Text("HRV: \(Int(entry.hrv ?? 0)) ms")
                                        Text(entry.miDetected == true ? "MI Detected" : "Normal")
                                            .foregroundColor(entry.miDetected == true ? .red : .green)
                                    }
                                    .font(.subheadline)
                                }
                            }
                        }
                        .onDelete(perform: deleteEntry)
                    }
                    .listStyle(PlainListStyle())
                    .navigationTitle("")
                    .navigationBarHidden(true)
                }
                .onAppear {
                    fetchHistory()
                }
            }
        }
    }

    func fetchHistory() {
        let db = Firestore.firestore()
        db.collection("Device").document(deviceID).collection("History")
            .order(by: "Timestamp", descending: true)
            .getDocuments { snapshot, error in
                guard let docs = snapshot?.documents else { return }
                historyEntries = docs.compactMap { doc in
                    let data = doc.data()
                    return HistoryEntry(
                        id: doc.documentID,
                        timestamp: (data["Timestamp"] as? Timestamp)?.dateValue(),
                        heartRate: data["HeartRate"] as? Double,
                        hrv: data["HRV"] as? Double,
                        miDetected: data["MI_Detected"] as? Bool,
                        ecg: data["ECG_LeadII"] as? [Double] ?? []
                    )
                }
            }
    }
    
    func deleteEntry(at offsets: IndexSet) {
        offsets.forEach { index in
            let entry = historyEntries[index]
            let db = Firestore.firestore()
            db.collection("Device").document("ECGCARDIA1").collection("History").document(entry.id).delete { error in
                if let error = error {
                    print("Error deleting entry: \(error.localizedDescription)")
                } else {
                    print("Successfully deleted entry with ID: \(entry.id)")
                }
            }
        }
        historyEntries.remove(atOffsets: offsets)
    }
}

struct HistoryEntry: Identifiable {
    let id: String
    let timestamp: Date?
    let heartRate: Double?
    let hrv: Double?
    let miDetected: Bool?
    let ecg: [Double]
}
