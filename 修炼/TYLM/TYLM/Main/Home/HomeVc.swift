//
//  HomeVc.swift
//  TYLM
//
//  Created by Mac on 2022/4/29.
//

import UIKit

import CoreLocation
import ObjectiveC
import SwiftyJSON
class HomeVc: BaseViewController {
    var dataArr : [CatergoryM]! = []
    var listArr : [GoodsListM]! = []

    var locMannager = CLLocationManager()
    
    var lgt : Double = 0.0
    var lat : Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
      startLocation()
      initCollectionView()
       queryList()
       
        
    }
    func initCollectionView(){
        
        collectionView.frame = CGRect.init(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight-Bottom_Bar_HEIGHT)
        
        collectionView.register(HomeHeaderCell.self, forCellWithReuseIdentifier: "HomeHeaderCell")
        view.addSubview(collectionView)
        
        collectionView.register(HomeCategoryCell.self, forCellWithReuseIdentifier: "HomeCategoryCell")
        
        collectionView.register(HomeServiceCell.self, forCellWithReuseIdentifier: "HomeServiceCell")
        
        collectionView.register(HomeListCell.self, forCellWithReuseIdentifier: "HomeListCell")
        view.addSubview(collectionView)
        
        
    }
}

extension HomeVc {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          
        switch section {
        case 1:
            return dataArr.count
        case 3:
            return listArr.count
        default:
            return 1
        }
}
    
   func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1 {
            let cell:HomeCategoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCategoryCell", for: indexPath) as! HomeCategoryCell
            let model = dataArr[indexPath.item]
            cell.textLab.text = model.merchantType
            cell.ImgView.kf.setImage(with: URL.init(string: model.picUrl))
            return cell
        }else if  indexPath.section == 2{
            
            
            let cell:HomeServiceCell  = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeServiceCell", for: indexPath) as! HomeServiceCell
            
            return  cell
        }else if indexPath.section == 3 {
            let cell:HomeListCell  = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeListCell", for: indexPath) as! HomeListCell
            
            let model = listArr[indexPath.item]
            cell.textLab.text = model.productName
            cell.ImgView.kf.setImage(with: URL.init(string: model.productLogo))
            cell.priceLab.text = String(format: "¥%.2f", model.salePrice)
            
            return  cell
            
        }
        
       
        let cell:HomeHeaderCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeHeaderCell", for: indexPath) as! HomeHeaderCell
        
        return   cell
    }
    
    
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         if indexPath.section == 1 {
             return CGSize(width: ScaleValue(70) , height: ScaleValue(100))
         }else  if indexPath.section == 2 {
             return  CGSize(width: (ScreenWidth - 2*ScaleValue(10)), height: ScaleValue(200))
         }else  if indexPath.section == 3 {
             return  CGSize(width: ScaleValue(175), height: ScaleValue(260))
         }
         return  CGSize(width: ScreenWidth, height: ScaleValue(316))
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
         if section == 1 {
           return  UIEdgeInsets.init(top: 0, left:ScaleValue(10), bottom: 0, right:ScaleValue(10))
         }else if section == 2 {
           return  UIEdgeInsets.init(top: ScaleValue(20), left:ScaleValue(10), bottom: ScaleValue(10), right:ScaleValue(10))
         }else if section == 3{
             return  UIEdgeInsets.init(top: 0, left:ScaleValue(10), bottom: 0, right:ScaleValue(10))

           }
        return .zero
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         if section == 1 || section == 3  {
             return ScaleValue(10)
         }
         return 0.0
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if section == 1 {
            return 1.0
        }else if section == 3 {
            return  0.0
        }
         return 0.0
    }
}
extension HomeVc {
    func queryList(){
        DispatchQueue.main.async {
            
            let dict = ["level":"1"]
            AlamofireManager.postApiRequest(ip:"\(GlobaleUrl)\(kHomeListAPI)", params: dict, finished: { result, error in
                
                let staus = RequestM.deserialize(from: result)
                
                if staus?.code == 200{
                    let data = CatergoryM.deserialize(from: result)
                    
                    self.dataArr.removeAll()
                    if let list = data?.data   {
                        for case let item? in list   {
                          if let model = CatergoryM.deserialize(from: item as? [String : Any])
                            {
                              self.dataArr.append(model)
                          }
                        }
                    }
                    self.collectionView.reloadData()
                }else{
                    print("获取数据有误")
                }
                
                })
        }
        
    }
    
    func queryGoodsList (){
        
        DispatchQueue.main.async {
            let dict = ["longitude":String(self.lgt) ,"latitude" : String(self.lat)]
            AlamofireManager.postApiRequest(ip: "\(GlobaleUrl)\(GoodsListAPI)", params: dict) {  result, error in
                
//                let jsonData = result?.data(using: .utf8)
//                let transferData = JSON.init(jsonData!)
//                print(transferData)
               
                
                let staus = RequestM.deserialize(from: result)
                
                if staus?.code == 200{
               
                    let data = GoodsListM.deserialize(from: result)
                    let dic  =  GoodsListM.deserialize(from: data?.data as? [String : Any])
                    
                    self.listArr.removeAll()
                    if let list = dic?.products   {
                    for case let item? in list   {
                        if let model = GoodsListM.deserialize(from: item as? [String : Any]){
                            self.listArr.append(model)
                        }
                        
                       
                    }
                }
                    self.collectionView.reloadData()
                    
                }else{
                    print("获取数据有误")
                  
                }
               
            }
            
        }
    }
    
}

extension HomeVc : CLLocationManagerDelegate {
    
    func startLocation(){
        locMannager.delegate = self
        locMannager.desiredAccuracy = kCLLocationAccuracyKilometer
//        if UIDevice.current.systemVersion >= "8.0" {
//
//        }
        locMannager.requestAlwaysAuthorization()
        locMannager.requestWhenInUseAuthorization()
        locMannager .startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let currLocation:CLLocation = locations.last!
        if currLocation.horizontalAccuracy >= 0.0 {
            lgt = currLocation.coordinate.longitude
            lat = currLocation.coordinate.latitude
            queryGoodsList()
        }
    }
    
    
     func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
         let offset = scrollView.contentOffset.y
         if offset > NavHeight{
             self.navigationController?.isNavigationBarHidden  = false
         }else{
             self.navigationController?.isNavigationBarHidden  = true
         }
    }
}


