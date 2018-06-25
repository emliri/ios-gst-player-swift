import UIKit

@UIApplicationMain class Application:UIResponder, UIApplicationDelegate {
    var window:UIWindow?
    
    func application(_:UIApplication, didFinishLaunchingWithOptions:[UIApplicationLaunchOptionsKey:Any]?) -> Bool {
        let window:UIWindow = UIWindow(frame:UIScreen.main.bounds)
        window.backgroundColor = UIColor.white
        window.makeKeyAndVisible()
        window.rootViewController = UIViewController()
        self.window = window
        return true
    }
}
