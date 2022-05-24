//
//  AppDelegate.swift
//  TYLM
//
//  Created by Mac on 2022/4/29.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var  window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if #available(iOS 13.0, *) {
            UIView.appearance().overrideUserInterfaceStyle = .light
        } else {
            
        }
        
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "完成"
        
        IQKeyboardManager.shared.enableAutoToolbar = true
        
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        window = UIWindow.init(frame: UIScreen.main.bounds)
        if let json = UserDefaults.standard.object(forKey: "login"){
            let userM : UserModel = UserModel.deserialize(from:json as? String)!
            UserModel.instance = userM
        }
       
      
        
        if let _ = UserModel.instance{
            let tabr = BaseTabBarController.init()
            window?.rootViewController = tabr
        }else{
            let login = BaseNavigationController.init(rootViewController: LoginVc.init())
            
            window?.rootViewController = login
        }
        
        
        window?.makeKeyAndVisible()
        
        
       
        return true
    }

    


}

