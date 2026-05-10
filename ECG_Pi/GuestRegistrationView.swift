import SwiftUI
import FirebaseFirestore
class UserData: ObservableObject {
    @Published var guestName: String = UserDefaults.standard.string(forKey: "guestName") ?? "Guest"
}
func saveGuestToFirestore(name: String, gender: String) {
    let db = Firestore.firestore()
    let guestData: [String: Any] = [
        "name": name,
        "gender": gender,
        "timestamp": Timestamp(date: Date())
    ]

    db.collection("GuestUser").document(name).setData(guestData) { error in
        if let error = error {
            print("🔥 Failed to save guest: \(error.localizedDescription)")
        } else {
            print("✅ Guest saved successfully under Users/\(name)")
        }
    }
}

struct GuestRegistrationView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name: String = ""
    @State private var selectedGender: GenderOption? = nil
    @State private var errorText: String = ""
    @State private var shouldNavigate = false
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                // 🔙 Back
                HStack {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.red)
                    }
                    Spacer()
                }
                .padding()

                // 🔠 Title
                Text("Guest Profile")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Name")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                    TextField("Your name", text: $name)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                }
                .padding(.horizontal)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Gender")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                    HStack(spacing: 10) {
                        ForEach(GenderOption.allCases) { option in
                            Button {
                                withAnimation(.spring()) {
                                    selectedGender = option
                                }
                            } label: {
                                ZStack {
                                    if selectedGender == option {
                                        Text(option.rawValue)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                            .padding()
                                            .background(option.backgroundColor)
                                            .cornerRadius(12)
                                            .scaleEffect(1.05)
                                    } else {
                                        Text(option.emoji)
                                            .font(.largeTitle)
                                            .frame(width: 60, height: 60)
                                            .background(Color.gray.opacity(0.1))
                                            .cornerRadius(12)
                                    }
                                }
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .padding(.horizontal)

                if !errorText.isEmpty {
                    Text(errorText)
                        .foregroundColor(.red)
                        .font(.caption)
                }

                Spacer()

                // ✅ Submit
                Button("Continue as Guest") {
                    if name.isEmpty || selectedGender == nil {
                        errorText = "Please provide your name and gender"
                        return
                    }

                    // ✅ Save to Firestore
                    saveGuestToFirestore(name: name, gender: selectedGender?.rawValue ?? "")
                    UserDefaults.standard.set(name, forKey: "guestName")
                    UserDefaults.standard.set(selectedGender?.rawValue, forKey: "guestGender")
                    UserDefaults.standard.set(true, forKey: "isLoggedIn")

                    errorText = ""
                    shouldNavigate = true // <-- Trigger navigation
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(15)
                .padding(.horizontal)
                .padding(.bottom)

                NavigationLink(destination: HomeView(), isActive: $shouldNavigate) {
                    EmptyView()
                }
            }
            .navigationBarHidden(true)
        }
    }
}
