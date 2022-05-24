//
//  BaseViewController.swift
//  TYLM
//
//  Created by Mac on 2022/4/29.
//

import UIKit

class BaseViewController: UIViewController ,UINavigationControllerDelegate ,UIGestureRecognizerDelegate  {
      
    lazy var tableView: UITableView = {
       
        let mtableView: UITableView = UITableView()
        mtableView.delegate   = self
        mtableView.dataSource = self
        
        mtableView.tableFooterView = UIView()
        
        mtableView.estimatedRowHeight = 100
        mtableView.rowHeight = UITableView.automaticDimension
        
        mtableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "UITableViewCell")
        
        return mtableView
    }()
    
    
     lazy var collectionView : UICollectionView =  {
        let collectionlayOut = UICollectionViewFlowLayout.init()
        collectionlayOut.minimumLineSpacing = 0;
        collectionlayOut.minimumInteritemSpacing = 0;

       let mcollectionView: UICollectionView = UICollectionView(frame: CGRect.zero,
                                                                 collectionViewLayout: collectionlayOut)
        mcollectionView.backgroundColor = listColor
        mcollectionView.delegate   = self
        mcollectionView.dataSource = self


        if #available(iOS 11.0, *) {
            mcollectionView.contentInsetAdjustmentBehavior = UIScrollView.ContentInsetAdjustmentBehavior.never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }

        // 绑定cell
        mcollectionView.register(UICollectionViewCell.self,
                                 forCellWithReuseIdentifier: "UICollectionViewCell")
        return mcollectionView
    }()
    
    


    
    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 13.0, *) {
            self.overrideUserInterfaceStyle = .light
        } else {
            // Fallback on earlier versions
        }
        
        self.view.backgroundColor = .white
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        
        
        self.navigationController?.delegate = self
        
        setNavBar()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    deinit {
//        print("释放了")
//    }
    
    
    
}

extension BaseViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return  tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  1
    }
   
}


extension BaseViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          
           return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return  collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
    }
    
}


extension BaseViewController {
    
    func setNavBar () {
        // 返回按钮
        let backButton = UIButton(type: .custom)
        // 给按钮设置返回箭头图片
        backButton.setBackgroundImage(UIImage(named: "icon_back-universal.png"), for: .normal)
        // 设置frame
        backButton.frame = CGRect(x: 200, y: ScaleValue(13), width: ScaleValue(20), height: ScaleValue(20))
        backButton.addTarget(self, action: #selector(backToPrevious), for: .touchUpInside)
        // 自定义导航栏的UIBarButtonItem类型的按钮
        let backView = UIBarButtonItem(customView: backButton)
        // 重要方法，用来调整自定义返回view距离左边的距离
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        barButtonItem.width = -5
        // 返回按钮设置成功
        navigationItem.leftBarButtonItems = [barButtonItem, backView]
    }
    
    
    //返回按钮点击响应
    @objc func backToPrevious(){
        self.navigationController!.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden  = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        self.navigationController?.isNavigationBarHidden  = false

    }
    
}
