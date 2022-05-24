//
//  HomeServiceCell.swift
//  TYLM
//
//  Created by Mac on 2022/4/29.
//

import UIKit

class HomeServiceCell: UICollectionViewCell {
    
    lazy var ImgView : UIImageView  =  {
     let mlocImgView = UIImageView()
       mlocImgView.contentMode = .scaleToFill
        mlocImgView.image = UIImage(named: "Home_Banner_3")
       return mlocImgView
       
   }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUI(){
        self.contentView.addSubview(ImgView)
        ImgView.snp.makeConstraints { make in
            make.width.equalTo(ScreenWidth)
            make.top.bottom.equalToSuperview()
            make.height.equalTo(ScaleValue(200))
        }
        
    }
}
