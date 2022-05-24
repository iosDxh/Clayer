//
//  BaseNavigationController.swift
//  TYLM
//
//  Created by Mac on 2022/4/29.
//

import UIKit

class BaseNavigationController: UINavigationController,UIGestureRecognizerDelegate,UINavigationBarDelegate,UINavigationControllerDelegate {

    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        self.navigationBar.barTintColor = BaseColor
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: ScaleValue(14)),NSAttributedString.Key.foregroundColor: UIColor.white ]
        
        if #available(iOS 15.0, *) {
                    let newAppearance = UINavigationBarAppearance()
                    newAppearance.configureWithOpaqueBackground()
            newAppearance.backgroundColor = .white
                  
            newAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: BaseColor, NSAttributedString.Key.font: UIFont.systemFont(ofSize: ScaleValue(18))]
                    
            UINavigationBar.appearance().standardAppearance = newAppearance
            UINavigationBar.appearance().scrollEdgeAppearance =  UINavigationBar.appearance().standardAppearance
        }
        
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.interactivePopGestureRecognizer?.delegate = self
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer == self.interactivePopGestureRecognizer {
            if self.viewControllers.count < 2 {
                return false
            }
        }
        return true
    }
    
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true;
        }
            
        super.pushViewController(viewController, animated: animated)
        viewController.navigationController? .setNavigationBarHidden(false, animated: true)
        self.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

extension  BaseNavigationController {
    
    
    
    
     
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .default
    }
    
    override var childForStatusBarStyle: UIViewController{
          
        
        return  self.topViewController!
    }
    
    override var childForStatusBarHidden: UIViewController{
        
        return self.topViewController!
    }
    
}
