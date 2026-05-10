import SwiftUI

struct IntroSliderView: View {
    @State private var currentIndex = 0
    @AppStorage("hasSeenIntro") var hasSeenIntro: Bool = false

    let slides: [IntroSlide] = [
        .init(title: "Preparation",
              description: "Remove any electrical equipment and metallic objects that may come in contact during the test (i.e. mobile phones, watches, etc.).",
              iconName: "bolt.fill"),
        .init(title: "Attachment",
              description: """
Attach the electrodes as follows:
Red: Right Upper Arm
Green: Left Upper Arm
Yellow: Left Upper Thigh
""",
              iconName: "waveform.path.ecg"),
        .init(title: "Power On",
              description: "Turn the electrocardiogram device on by pressing and holding the power button until the indicator light illuminates.",
              iconName: "power")
    ]

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                // 🔺 TOP 60% — TabView (icon only)
                TabView(selection: $currentIndex) {
                    ForEach(0..<slides.count, id: \.self) { index in
                        ZStack {
                            Color.red
                                .ignoresSafeArea(.all)

                            VStack {
                                Spacer()
                                Image(systemName: slides[index].iconName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 120, height: 120)
                                    .foregroundColor(.white)
                                Spacer()
                            }
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.6)
                        .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: geometry.size.height * 0.6)

                // 🔻 BOTTOM 40% — Fixed RoundedRectangle content area
                ZStack {
                    Color.red.ignoresSafeArea() // 🔴 Fill background behind rounded

                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.white)
                        .frame(height: geometry.size.height * 0.4)
                        .padding(.horizontal, 16)
                        .shadow(radius: 4)
                        .overlay(
                            VStack(spacing: 20) {
                                // 🧱 Title + Description with fade animation
                                VStack(spacing: 12) {
                                       Text(slides[currentIndex].title)
                                           .font(.title)
                                           .bold()
                                           .foregroundColor(.black)
                                           .transition(.opacity)

                                       Text(slides[currentIndex].description)
                                           .font(.body)
                                           .multilineTextAlignment(.center)
                                           .foregroundColor(.black)
                                           .padding(.horizontal)
                                           .transition(.opacity)
                                   }
                                   .id(currentIndex)
                                   .animation(.easeInOut(duration: 0.3), value: currentIndex)

                                   // ... Dot + Button ...
                               
                                // ⭕ Dot Indicator
                                HStack(spacing: 8) {
                                    ForEach(0..<slides.count, id: \.self) { index in
                                        Circle()
                                            .fill(index == currentIndex ? Color.red : Color.gray.opacity(0.3))
                                            .frame(width: 10, height: 10)
                                    }
                                }

                                // 🔘 Button (Next / I'm Ready)
                                Button(action: {
                                    if currentIndex < slides.count - 1 {
                                        withAnimation {
                                            currentIndex += 1
                                        }
                                    } else {
                                        hasSeenIntro = true
                                    }
                                }) {
                                    Text(currentIndex == slides.count - 1 ? "I'm Ready" : "Next")
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color.red)
                                        .foregroundColor(.white)
                                        .cornerRadius(15) // 👈 Round all 4 corners
                                        .animation(.easeInOut, value: currentIndex)
                                        .transition(.opacity)
                                }
                                .padding(.horizontal)
                                .padding(.bottom, 5)
                            }
                            .padding(12) // ✅ Add padding around all content
                        )
                }
                .frame(height: geometry.size.height * 0.4)
            }
        }
    }
}

// 🧩 Slide Model
struct IntroSlide {
    let title: String
    let description: String
    let iconName: String
}
