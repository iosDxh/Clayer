//
//  GoodsVc.swift
//  TYLM
//
//  Created by Mac on 2022/5/5.
//

import UIKit

class GoodsVc: BaseViewController  {

    override func viewDidLoad() {
        super.viewDidLoad()
      
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden  = false
        
        let arr = [1,2,nil,6,8]
        
        
        
        
        for case let item? in arr {
            
            print(item)
            
           
           
        }
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
