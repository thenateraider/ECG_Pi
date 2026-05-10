import SwiftUI

struct SplashContainerView: View {
    @State private var showSplash = true
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @AppStorage("hasSeenIntro") var hasSeenIntro: Bool = false

    @Namespace private var animation

    var body: some View {
        ZStack {
            if showSplash {
                Color.redPrimeAccent
                    .ignoresSafeArea()
                VStack {
                    Image("WhiteLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .padding(.top, 20)
                }
                .transition(.identity)
            } else {
                nextView()
                    .transition(.move(edge: .trailing)) 
            }
        }
        .animation(.easeInOut(duration: 0.5), value: showSplash)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    showSplash = false
                }
            }
        }
    }

    @ViewBuilder
    private func nextView() -> some View {
        if isLoggedIn {
            HomeView()
        } else if hasSeenIntro {
            LoginView()
        } else {
            IntroSliderView()
        }
    }
}
