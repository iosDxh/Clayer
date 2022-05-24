//
//  RequestM.swift
//  TYLM
//
//  Created by Mac on 2022/4/30.
//

import UIKit
import HandyJSON

class RequestM: HandyJSON {
    
    var phone : String!
    var pwd : String!
    
    var code : Int?
    
    var data : String?
    
    var dioctAny : AnyObject?
     
    var level : String?

    
    required init() {
        
    }

}

extension RequestM {
    static func GetRequestDic(requestParam param:[String:String]?) -> [String:String] {
        let requestM = RequestM.deserialize(from: param)
        
        requestM!.phone = param!["phone"]
        requestM!.pwd = param!["pwd"]

        var para = ["":""]
        if param != nil{
            para = param!
        }
        
        let dic:[String : String]? = requestM!.toJSON() as? [String : String]

        return dic!
    }
    
   
}
    
