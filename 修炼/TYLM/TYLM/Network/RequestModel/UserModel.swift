//
//  UserModel.swift
//  TYLM
//
//  Created by Mac on 2022/5/1.
//

import UIKit
import HandyJSON


final class UserModel  : HandyJSON  {
       
        var memberName : String = ""
        var memberCode : String = ""
        var memberLogo : String = ""
        var token : String = ""
        var totalMoney : String = ""
        var burseMoney : String = ""
        var phone : String = ""
    
      
    
        static var instance : UserModel!

   

    
    
}
