import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

      
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        FirebaseApp.configure()
        return true
    }
}


@main
struct ECG_PiApp: App {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @AppStorage("hasSeenIntro") var hasSeenIntro: Bool = false
    // เชื่อม AppDelegate กับ SwiftUI
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    init() {
        if !isLoggedIn {
            hasSeenIntro = false
        }
    }

    var body: some Scene {
        WindowGroup {
            SplashContainerView()
        }
    }
}
