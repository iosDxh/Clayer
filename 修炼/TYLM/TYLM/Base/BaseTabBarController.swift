//
//  BaseTabBarController.swift
//  TYLM
//
//  Created by Mac on 2022/4/29.
//

import UIKit

class BaseTabBarController: UITabBarController,UITabBarControllerDelegate  {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        
        tabBar.tintColor = BaseColor //tabbar 字体颜色
        tabBar.barTintColor = UIColor.white //tabbar 背景颜色
        addChildVC(childVC: HomeVc() , childTitle: "首页", imageName:"Home_Tabr_normal", selectedImageName: "Home_Tabr_select", tag: 0)
        
        addChildVC(childVC: GoodsVc() , childTitle: "全部商品", imageName:"Home_Tabr_normal", selectedImageName: "Home_Tabr_select", tag: 1)
        addChildVC(childVC: HomeVc() , childTitle: "消息", imageName:"Home_Tabr_normal", selectedImageName: "Home_Tabr_select", tag: 2)
        addChildVC(childVC: HomeVc() , childTitle: "购物车", imageName:"Home_Tabr_normal", selectedImageName: "Home_Tabr_select", tag: 3)
        addChildVC(childVC: HomeVc() , childTitle: "我的", imageName:"Home_Tabr_normal", selectedImageName: "Home_Tabr_select", tag: 4)
      
        
    }
    
    
    
    /// 添加子控制器
    private func addChildVC(childVC:BaseViewController, childTitle: String, imageName: String, selectedImageName:String,tag:Int)
    {
        let navigation = BaseNavigationController(rootViewController: childVC)
//        navigation.navigationBar.tintColor = UIColor.black //item 字体颜色
//        navigation.navigationBar.barTintColor = BaseColor //背景颜色
//        let dict:NSDictionary = [NSAttributedString.Key.foregroundColor: UIColor.black,NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]
//        //标题颜色
//        navigation.navigationBar.titleTextAttributes = dict as? [NSAttributedString.Key : Any]
        childVC.title = childTitle
        childVC.tabBarItem.tag = tag
        childVC.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        childVC.tabBarItem.selectedImage = UIImage(named: selectedImageName)?.withRenderingMode(.alwaysOriginal)
        self.addChild(navigation)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
