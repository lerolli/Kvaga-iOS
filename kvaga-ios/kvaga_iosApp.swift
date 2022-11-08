import SwiftUI
import YandexMapsMobile
import UIKit

// no changes in your AppDelegate class
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        YMKMapKit.setApiKey("e97595cf-7fa8-429b-a965-b0b21f3f376a")
        YMKMapKit.sharedInstance()
        return true
    }
}

@main
struct kvaga_iosApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
