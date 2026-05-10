import SwiftUI

struct IntroSlideView: View {
    @State private var showLogin = false
    @State private var currentIndex = 0
    var title: String
    var description: String
    var iconName: String
    var buttonTitle: String
    var onNext: () -> Void

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                
                ZStack {
                    Color.red
                        .ignoresSafeArea() 

                    Image(systemName: iconName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .foregroundColor(.white)
                }
                .frame(height: geometry.size.height * 0.6)
            
                //  BOTTOM 40% – Rounded Rectangle สีขาว
                ZStack {
                    Color.clear
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.white)
                        .frame(height: geometry.size.height * 0.4)
                        .overlay(
                            VStack(spacing: 20) {
                                Text(title)
                                    .font(.title)
                                    .bold()

                                Text(description)
                                    .font(.body)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)

                                HStack(spacing: 8) {
                                    Circle().fill(currentDot(0)).frame(width: 10, height: 10)
                                    Circle().fill(currentDot(1)).frame(width: 10, height: 10)
                                    Circle().fill(currentDot(2)).frame(width: 10, height: 10)
                                }

                                Button(action: onNext) {
                                    Text(buttonTitle)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color.red)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                                .padding(.horizontal)
                                .padding(.bottom, 10)
                            }
                            .padding(.top, 30)
                            .padding(.horizontal)
                        )
                }
                .frame(height: geometry.size.height * 0.4)
            }
        }
    }

    private func currentDot(_ index: Int) -> Color {
        switch buttonTitle {
        case "Next":
            return (index == getIndex()) ? .red : .gray.opacity(0.3)
        case "I'm Ready":
            return (index == 2) ? .red : .gray.opacity(0.3)
        default:
            return .gray
        }
    }

    private func getIndex() -> Int {
        if title.contains("Preparation") { return 0 }
        else if title.contains("Attachment") { return 1 }
        else { return 2 }
    }
}
