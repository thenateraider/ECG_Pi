import SwiftUI
import FirebaseFirestore
import PDFKit

struct HistoryDetailView: View {
    let entry: HistoryEntry
    @State private var zoomScale: CGFloat = 1.0
    @State private var offset: CGSize = .zero
    @State private var isSharingPDF = false
    @State private var pdfData: Data?

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                HStack {

                    Button(action: {
                        exportPDF()
                    }) {
                        Label("Share as PDF", systemImage: "square.and.arrow.up")
                            .font(.title3)
                            .padding()
                            .background(Color.blue.opacity(0.2))
                            .cornerRadius(8)
                    }
                    .sheet(isPresented: $isSharingPDF) {
                        if let data = pdfData {
                            ActivityView(activityItems: [data])
                        }
                    }
                }
                .padding(.horizontal)

                GeometryReader { geometry in
                    let visibleRange: Int = 50 // 2 seconds at 1000 Hz
                    let ecgData = Array(entry.ecg.prefix(visibleRange))

                    let maxPoints = min(ecgData.count, visibleRange)

                    let graphHeight: CGFloat = 300

                    ZStack {
                        GridBackgroundView()
                            .frame(height: graphHeight)
                            .border(Color.gray, width: 1)
                        SimpleECGGraphView(data: ecgData)
                            .frame(height: graphHeight)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    }
                }
                .frame(height: 300)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Heart Rate: \(Int(entry.heartRate ?? 0)) BPM")
                    Text("HRV: \(Int(entry.hrv ?? 0)) ms")
                    Text("MI Detected: \(entry.miDetected == true ? "Yes" : "No")")
                    Text("Sample Count: \(entry.ecg.count)")
                }
                .padding(.horizontal)
                .padding(.top, 16) // Adjusted vertical spacing
            }
            .padding(.top)
        }
    }

    private func exportPDF() {
        let content = VStack(spacing: 16) {
            HStack {
                Spacer()
                Text(entry.timestamp?.formatted(date: .abbreviated, time: .standard) ?? "")
                    .font(.title3)
                    .bold()
                Label("Share as PDF", systemImage: "square.and.arrow.up")
                    .font(.title)
                    .padding()
            }
            .padding(.horizontal)

            GeometryReader { geometry in
                let visibleRange: Int = 50
                let ecgData = Array(entry.ecg.prefix(visibleRange))
                let graphHeight: CGFloat = 300

                ZStack {
                    GridBackgroundView()
                        .frame(height: graphHeight)
                        .border(Color.gray, width: 1)
                    SimpleECGGraphView(data: ecgData)
                        .frame(height: graphHeight)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }
            }
            .frame(height: 300)

            VStack(alignment: .leading, spacing: 8) {
                Text("Heart Rate: \(Int(entry.heartRate ?? 0)) BPM")
                Text("HRV: \(Int(entry.hrv ?? 0)) ms")
                Text("MI Detected: \(entry.miDetected == true ? "Yes" : "No")")
                Text("Sample Count: \(entry.ecg.count)")
            }
            .padding(.horizontal)
        }
        .padding()

        let hostingController = UIHostingController(rootView: content)
        let targetSize = CGSize(width: 595, height: 842)
        hostingController.view.bounds = CGRect(origin: .zero, size: targetSize)
        hostingController.view.backgroundColor = .white

        DispatchQueue.main.async {
            let renderer = UIGraphicsImageRenderer(size: targetSize)
            let image = renderer.image { ctx in
                hostingController.view.drawHierarchy(in: hostingController.view.bounds, afterScreenUpdates: true)
            }

            let pdfRenderer = UIGraphicsPDFRenderer(bounds: CGRect(origin: .zero, size: targetSize))
            let data = pdfRenderer.pdfData { context in
                context.beginPage()
                image.draw(at: .zero)
            }

            pdfData = data
            isSharingPDF = true
        }
    }

}

struct GridBackgroundView: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = geometry.size.width
                let height = geometry.size.height
                let spacing: CGFloat = 40
                
                for i in stride(from: 0, to: width, by: spacing) {
                    path.move(to: CGPoint(x: i, y: 0))
                    path.addLine(to: CGPoint(x: i, y: height))
                }
                for j in stride(from: 0, to: height, by: spacing) {
                    path.move(to: CGPoint(x: 0, y: j))
                    path.addLine(to: CGPoint(x: width, y: j))
                }
            }
            .stroke(Color.gray.opacity(0.3), lineWidth: 0.5)
        }
    }
}
