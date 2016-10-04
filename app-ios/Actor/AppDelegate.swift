//
//  Copyright (c) 2014-2015 Actor LLC. <https://actor.im>
//

import UIKit
import ActorSDK
import HockeySDK

@UIApplicationMain
class AppDelegate: ActorApplicationDelegate {
    
    override init() {
        super.init()
        
        ActorSDK.sharedActor().endpoints = ["tcp://tcp.hyenas.sexywaffles.com:8443"]
        ActorSDK.sharedActor().appName = "SexyWaffles"
        
        ActorSDK.sharedActor().enableCalls = false
        ActorSDK.sharedActor().enableVideoCalls = false
        ActorSDK.sharedActor().enablePhoneBookImport = false
        ActorSDK.sharedActor().authStrategy = .EmailOnly
        
        ActorSDK.sharedActor().inviteUrlHost = "hyenas.sexywaffles"
        ActorSDK.sharedActor().inviteUrlScheme = "gooner"
        
        ActorSDK.sharedActor().apiPushId = 22081987
        ActorSDK.sharedActor().autoPushMode = AAAutoPush.AfterLogin
        
        // Styling of app
        let style = ActorSDK.sharedActor().style
        style.chatBgColor = UIColor(red:0.97, green:0.97, blue:0.97, alpha:1.0)
        style.searchStatusBarStyle = .default
        style.dialogAvatarSize = 58
        style.welcomeLogo = UIImage(named: "sexywaffles-logo")
        
        // Creating Actor
        ActorSDK.sharedActor().createActor()
    }
    
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [AnyHashable: Any]?) -> Bool {
        super.application(application, didFinishLaunchingWithOptions: launchOptions as! [UIApplicationLaunchOptionsKey : Any]?)
        
        BITHockeyManager.shared().configure(withIdentifier: "a1f964f1c155443f9b9aa0639772c029");
        BITHockeyManager.shared().start();
        BITHockeyManager.shared().authenticator.authenticateInstallation();

        ActorSDK.sharedActor().presentMessengerInNewWindow()
        return true
    }
    
    override func actorControllerForAuthStart() -> UIViewController? {
        return AuthController()
    }
    
    override func actorControllerForSettings() -> UIViewController? {
        return SettingsController()
    }
    
    override func actorControllerForContacts() -> UIViewController? {
        return ContactsController()
    }
    
    override func actorControllerForStart() -> UIViewController? {
        return RootController()
    }
}
