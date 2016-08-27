//
//  Copyright (c) 2014-2015 Actor LLC. <https://actor.im>
//

import UIKit
import ActorSDK

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
        
        ActorSDK.sharedActor().style.welcomeLogo = UIImage(named: "sexywaffles-logo")
        
        // Invite URL configuration
        ActorSDK.sharedActor().inviteUrlHost = "hyenas.sexywaffles"
        ActorSDK.sharedActor().inviteUrlScheme = "gooner"
        
        // Support Information configuration
        
        // Push Configuration
        // Enter Here your push id
        // ActorSDK.sharedActor().apiPushId = ???
        // Enable Push Notifications only after log in
        ActorSDK.sharedActor().autoPushMode = AAAutoPush.AfterLogin
        
        // Styling of app
        let style = ActorSDK.sharedActor().style
        style.chatBgColor = UIColor.whiteColor()
        
        // Creating Actor
        ActorSDK.sharedActor().createActor()
    }
    
    override func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        super.application(application, didFinishLaunchingWithOptions: launchOptions)
        // Showing
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