//
//  DefautSerVice.swift
//  TYLM
//
//  Created by Mac on 2022/5/1.
//

import UIKit


class DefautSerVice {
    
    let defaults: UserDefaults
    
    init(defaults: UserDefaults) {
        self.defaults = defaults
    }
    
    required init() {
        defaults = UserDefaults.standard
    }
    
    
    var userM : UserModel?{
        set {
            defaults.setValue(newValue?.toJSONString(), forKey: "login")
        }
        get {
            UserModel.deserialize(from: (defaults.object(forKey: "login") as? String))
           
        }
    }
}
