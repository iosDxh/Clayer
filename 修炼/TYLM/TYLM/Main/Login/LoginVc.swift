//
//  LoginVc.swift
//  TYLM
//
//  Created by Mac on 2022/4/30.
//

import UIKit
import SwiftyJSON
import HandyJSON

class LoginVc: BaseViewController {
    private  var txt_account :UITextField  = UITextField()
    private var txt_pwd : UITextField = UITextField()
    
    private lazy var bcgImgView : UIImageView  =  {
      let mbcgImgView = UIImageView()
        mbcgImgView.image = UIImage.init(named: "Login_bgImage")
        mbcgImgView.contentMode = .scaleToFill
        return mbcgImgView
        
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
       
    }
    

    func initUI(){
        view.addSubview(bcgImgView)
        bcgImgView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        let btn_Login = UIButton(type: UIButton.ButtonType.custom)
        btn_Login.setTitle("立即登录", for: UIControl.State.normal)
        btn_Login.titleLabel?.font = UIFont.systemFont(ofSize: ScaleValue(16))
        btn_Login.backgroundColor = BaseColor
        btn_Login.layer.cornerRadius = ScaleValue(20)
        btn_Login.layer.masksToBounds = true;
        btn_Login.setTitleColor(UIColor.white, for: UIControl.State.normal)
        view.addSubview(btn_Login)
        btn_Login.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        
        
        view.addSubview(btn_Login)
        btn_Login.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-(Bottom_Bar_HEIGHT+ScaleValue(60)))
            make.width.equalTo(ScaleValue(310))
            make.centerX.equalToSuperview()
            make.height.equalTo(ScaleValue(44))
            
        }
        
        
        
       
        let pwdLine = UIView()
        pwdLine.backgroundColor  = SepColor
        
        let pwdImgView = UIImageView()
        pwdImgView.image = UIImage.init(named: "icon_password")
        pwdImgView.contentMode = .scaleAspectFill
        txt_pwd.placeholder = "请输入密码"
        txt_pwd.textColor = TextBlackColor
        txt_pwd.isSecureTextEntry = true
        txt_pwd.keyboardType = .numbersAndPunctuation
       
        view.addSubview(pwdLine)
        
        pwdLine.snp.makeConstraints { make in
            make.height.equalTo(ScaleValue(0.5))
            make.width.equalTo(ScaleValue(310))
            make.bottom.equalTo(btn_Login.snp_top).offset(-ScaleValue(30))
            make.centerX.equalToSuperview()
            
        }
        
        view.addSubview(pwdImgView)
        pwdImgView.snp.makeConstraints { make in
            make.width.height.equalTo(ScaleValue(20))
            make.bottom.equalTo(pwdLine.snp_top).offset(-ScaleValue(10))
            make.left.equalTo(pwdLine.snp_left).offset(ScaleValue(10))
            
        }
        view.addSubview(txt_pwd)
        txt_pwd.snp.makeConstraints { make in
            make.height.equalTo(ScaleValue(20))
            make.centerY.equalTo(pwdImgView.snp_centerY)
            make.left.equalTo(pwdImgView.snp_right).offset(ScaleValue(10))
            make.right.equalTo(pwdLine.snp_right).offset(-ScaleValue(10))
        }
        
        
        let accountLine = UIView()
        accountLine.backgroundColor  = SepColor
        
        let accountImgView = UIImageView()
        accountImgView.image = UIImage.init(named: "icon_user")
        accountImgView.contentMode = .scaleAspectFill
        txt_account.placeholder = "请输入登录名"
        txt_account.textColor = TextBlackColor
        txt_account.keyboardType = .numberPad
        
        view.addSubview(accountLine)
        accountLine.snp.makeConstraints { make in
            make.height.equalTo(ScaleValue(1))
            make.width.equalTo(ScaleValue(310))
            make.bottom.equalTo(pwdImgView.snp_top).offset(-ScaleValue(30))
            make.centerX.equalToSuperview()
            
        }
        
        view.addSubview(accountImgView)
        accountImgView.snp.makeConstraints { make in
            make.width.height.equalTo(ScaleValue(20))
            make.bottom.equalTo(accountLine.snp_top).offset(-ScaleValue(10))
            make.left.equalTo(accountLine.snp_left).offset(ScaleValue(10))
            
        }
        view.addSubview(txt_account)
        txt_account.snp.makeConstraints { make in
            make.height.equalTo(ScaleValue(20))
            make.centerY.equalTo(accountImgView.snp_centerY)
            make.left.equalTo(accountImgView.snp_right).offset(ScaleValue(10))
            make.right.equalTo(accountLine.snp_right).offset(-ScaleValue(10))
        }
        
        
    }
    
    @objc func loginAction(){
        if txt_account.text!.count > 0 &&  txt_pwd.text!.count>0 {
            let dict : [String : String]  = ["phone" : txt_account.text! , "pwd" : txt_pwd.text!.md5 ]
            AlamofireManager.postApiRequest(ip: "\(GlobaleUrl)\(kLoginAPI)", params: dict) { result, error in
                let jsonData = result?.data(using: .utf8)
                let transferData = JSON.init(jsonData!)
                
                
                let requestm = RequestM.deserialize(from: result!)
                
                
                if requestm!.code == 200 {


                    self.showSuccessHUD("登录成功")

                    
                    
                    DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                        UIApplication.shared.keyWindow!.rootViewController = BaseTabBarController.init()
                    }
                   
                    
                    
                    

                    DispatchQueue.global().async {
                        
                       
                        let json1 =  transferData["data"] as? JSON
                        
                        print("\(type(of: json1))")
                       
                        let userM : UserModel = UserModel.deserialize(from:json1?.rawString())!
                       
                        UserModel.instance = userM
                        UserDefaults.standard.setValue(userM.toJSONString(), forKey: "login")
                        
        
                        
//                        print("\(userSerVice.userM )")
                    }


                }
                
                
                
               

                
              
                  
              
              
               
                
        
                
            
               

                
                
            }
            
            
        }
        
    }

}
