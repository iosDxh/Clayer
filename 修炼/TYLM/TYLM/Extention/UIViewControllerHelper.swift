//
//  UIViewControllerHelper.swift
//  HKAtHome
//
//  Created by 陈 颜俊 on 2016/9/24.
//  Copyright © 2016年 HomeKing. All rights reserved.
//

import UIKit
import MBProgressHUD


extension UIViewController {
    public enum CallType {
        case webView
        case openUrl
    }
    
    // MARK: - HUD
    
    public func setupHudStyle(_ hud: MBProgressHUD) {
        hud.bezelView.style = .solidColor
        hud.bezelView.color = .black
        hud.contentColor = .white
    }
    
    public func showProgressHUD(_ message: String) {
        self.dismissHUD()
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        self.setupHudStyle(hud)
        hud.label.text = message
    }
    
    public func showInfoHUD(_ info: String) {
        self.dismissHUD()
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        self.setupHudStyle(hud)
        hud.mode = .text
        hud.detailsLabel.text = info
        hud.detailsLabel.font = hud.label.font
        hud.hide(animated: true, afterDelay: 1.2)
    }
    
    public func showProgressHUD() {
        self.dismissHUD()
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        self.setupHudStyle(hud)
    }
    
    public func showStatusHUD(_ status: String) {
        self.dismissHUD()
        self.showProgressHUD(status)
    }
    
    public func showSuccessHUD(_ message: String) {
        if message.isEmpty {
            self.dismissHUD()
        } else {
            self.showInfoHUD(message)
        }
    }
    
    public func showErrorHUD(_ message: String) {
        if message.isEmpty {
            self.dismissHUD()
        } else {
            self.showInfoHUD(message)
        }
    }
    
    public func dismissHUD() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    // MARK: - Alert
    
    public func showAlert(_ title: String, message: String?) {
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "确定", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    public func call(phoneNumber phone: String, callType: CallType) {
        let isPhone = true
        guard isPhone else {
            self.showErrorHUD("电话号码格式不正确")
            return
        }
        
        let phoneCommand = "tel:\(phone)"
        guard let url = URL(string: phoneCommand) else {
            return
        }
        
        if callType == .webView {
            let callWebview = UIWebView()
            guard UIApplication.shared.canOpenURL(url) else {
                self.showErrorHUD("该设备暂不支持拨号!")
                return
            }
            callWebview.loadRequest(URLRequest(url: url))
            self.view.addSubview(callWebview)
            
        } else {
            guard UIApplication.shared.canOpenURL(url) else {
                self.showErrorHUD("该设备暂不支持拨号!")
                return
            }
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    // MARK: -
    
    public func delay(_ delay:Double? = 1.0, closure:@escaping ()->Void) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay! * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure
        )
    }
    
}
