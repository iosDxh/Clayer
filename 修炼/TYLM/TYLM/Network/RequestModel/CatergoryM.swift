//
//  CatergoryM.swift
//  TYLM
//
//  Created by Mac on 2022/5/4.
//

import UIKit
import HandyJSON

class CatergoryM: HandyJSON {
    
    var merchantType = ""
    
    var picUrl = ""
    
    var data : [AnyObject]?

    required init() {
        
    }
    
    func mapping(mapper: HelpingMapper) {
        mapper.specify(property: &picUrl, name: "merchantTypePic")
    }
}

class GoodsListM :HandyJSON{
    
    var longitude : Double = 0.0
    
    var latitude : Double  = 0.0
    
    var data : [String : Any]?
    
    var merchantEnvPic :  String  = ""
    
    var merchantType :  String  = ""
    
    var  salePrice :  Double = 0.00
    var  products : [AnyObject]?
    
    var productName :  String  = ""
    
    var productLogo :  String  = ""


   

    
   

    
    required init() {
        
    }
    
}
