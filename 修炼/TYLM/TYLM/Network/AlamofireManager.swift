//
//  AlamofireManager.swift
//  SGGiTiShop_iOS
//
//  Created by ShangGuo on 2018/3/13.
//  Copyright © 2018年 Seocoo. All rights reserved.
//

import UIKit
class AlamofireManager{
    /// 创建单例
    static let shareInstance : AlamofireManager = {
        print("AlamofireManager创建了")
     return AlamofireManager()
        
       
      }()
    
//    deinit {
//        print("AlamofireManager释放了")
//    }
    
}

//MARK: - 网络请求封装: 二级封装
extension AlamofireManager{
    
    ///不同ip的参数
    static func  postApiRequest(ip:String, params : [String : String]?, finished :@escaping (_ result :String?, _ error : String?)-> ()) {
        ///自定义headerFile以及参数
        let sg_headerFile:[String:String] = configHeaders()
        let sg_params:[String : Any] = params ?? ["" : ""]

        post(posturl: ip, params: sg_params, headerFile: sg_headerFile) { (jsonString, error) in
            if error?.domain == "NSURLErrorDomain"{
                finished(jsonString,"网络不可用")
            }else{
                finished(jsonString,error?.domain)
            }
        }
    }
    
    ///简单参数
    static func  postRequest(params : [String : String]?, finished :@escaping (_ result :String?, _ error : String?)-> ()) {
        ///自定义headerFile以及参数
        let sg_headerFile:[String:String] = configHeaders()
        let sg_params:[String : String] = RequestM.GetRequestDic(requestParam: params)
        print(sg_params)
        post(posturl: GlobaleUrl, params: sg_params, headerFile: sg_headerFile) { (jsonString, error) in
            if error?.domain == "NSURLErrorDomain"{
                finished(jsonString,"网络不可用")
            }else{
                finished(jsonString,error?.domain)
            }
        }
    }
    
    
}


//MARK: - 网络请求封装:一级封装
extension AlamofireManager {

    static private func configHeaders() -> HTTPHeaders {
        
       
        
        let headers: HTTPHeaders =  UserModel.instance == nil ? [
            "Content-Type": "application/json; charset=utf-8",
            

            
        ] : [
            "Content-Type": "application/json; charset=utf-8",
            "token": UserModel.instance.token,
            "phone": UserModel.instance.phone,


        ]
        
        return headers
    }
    
    static private func get(geturl:String,params:[String:Any],headerFile:[String:String],finished :@escaping (_ result : AnyObject?, _ error : NSError?)-> ()){
        
        Alamofire.request(geturl, method: .get, parameters: params, encoding: JSONEncoding.default, headers: headerFile).responseJSON { (response) in
            //是否请求成功
            switch response.result{
                
            case .success(_):
                if let value = response.result.value {
                    let json = JSON(value)
                    finished(json as AnyObject, nil)
                }
            case .failure(_):
                finished(nil, response.result.error as NSError?)
            }
        }
    }
    
    static private func post(posturl:String,params:[String:Any],headerFile:[String:String],finished :@escaping (_ result : String?, _ error : NSError?)-> ()){
        Alamofire.request(posturl, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headerFile).responseJSON { (response) in
            switch response.result{
            case .success(_):
                if let value = response.result.value {
                    let json = JSON(value)
                    
                    finished(json.rawString(), nil)
                }
            case .failure(_):
                finished(nil, response.result.error as? NSError)
            }
        }
    }
    
   
}

