//
//  ConfigList.swift
//  TYLM
//
//  Created by Mac on 2022/4/29.
//

import UIKit

@_exported import SnapKit
@_exported import HandyJSON
@_exported import SwiftyJSON
@_exported import Alamofire
@_exported import IQKeyboardManagerSwift
@_exported import Kingfisher



//判断是否iPhone
let IsIphone : Bool = UIDevice.current.userInterfaceIdiom == .phone
//判断是否ipd
let IsIpd: Bool = UIDevice.current.userInterfaceIdiom == .pad

//判断是否iPhoneX
let IsIphoneX : Bool =  Bottom_Safe_HEIGHT > 0.0  && IsIphone
//状态栏高度
let StatusBarHeight : CGFloat = UIApplication.shared.statusBarFrame.height

//底部的安全距离
let Bottom_Safe_HEIGHT : CGFloat = {
    if #available(iOS 11.0, *) {
        return  UIApplication.shared.delegate?.window??.safeAreaInsets.bottom ?? 0.0
    } else {
        return 0.0
    }
    
}()


let ScreenWidth:CGFloat = UIScreen.main.bounds.width

let ScreenHeight:CGFloat = UIScreen.main.bounds.height


let NavHeight:CGFloat = StatusBarHeight + 44.0

let Bottom_Bar_HEIGHT : CGFloat = Bottom_Safe_HEIGHT + (IsIphone ? 49.0 : 50.0)


var ScaleValue:(CGFloat) ->CGFloat = {
    value in return ScreenWidth/375.0*value
}



/// 颜色配置
var RGBAColor: (CGFloat, CGFloat, CGFloat, CGFloat) -> UIColor = {red, green, blue, alpha in
    return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha);
}
var RGBColor: (CGFloat, CGFloat, CGFloat) -> UIColor = {red, green, blue in
    return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1);
}
var ColorWithHex: (NSInteger) -> UIColor = { hex in
    
    let redValue   = ((CGFloat)((hex & 0xFF0000) >> 16))
    let greenValue = ((CGFloat)((hex & 0xFF00) >> 8))
    let blueValue  = ((CGFloat)(hex & 0xFF))
    
    return UIColor(red: redValue / 255.0,
                   green: greenValue / 255.0,
                   blue: blueValue / 255.0,
                   alpha: 1);
}
var ColorWithHexAndAlpha: (NSInteger,CGFloat) -> UIColor = { hex,alpha in
    
    let redValue   = ((CGFloat)((hex & 0xFF0000) >> 16))
    let greenValue = ((CGFloat)((hex & 0xFF00) >> 8))
    let blueValue  = ((CGFloat)(hex & 0xFF))
    
    return UIColor(red: redValue / 255.0,
                   green: greenValue / 255.0,
                   blue: blueValue / 255.0,
                   alpha: alpha);

}

let BaseColor = RGBColor(215,0,0)//主色调
let TextBlackColor = ColorWithHex(0x333333)//文字黑色
let TextDarkGrayColor = ColorWithHex(0x666666)//文字深灰色
let TextGrayColor = ColorWithHex(0x999999)//文字灰色

let listColor = ColorWithHex(0xf8f8f8)//列表颜色
let SepColor = RGBColor(239,239,239)//分割线颜色



/// 圆角配置
let GT_RoundRect_Scala:CGFloat = (ScreenWidth==414 ? 1.2 : (ScreenWidth==320 ? 0.9 : 1))//圆角比例



let GlobaleUrl = "http://gylmapi.pluss.cn/"///请求url
let kHomeListAPI = "merchantType/queryList"
let kLoginAPI =  "member/login"
let GoodsListAPI = "merchantProduct/queryListByLonditude"



