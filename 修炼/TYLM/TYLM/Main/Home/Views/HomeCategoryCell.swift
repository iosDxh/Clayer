//
//  HomeCategoryCell.swift
//  TYLM
//
//  Created by Mac on 2022/4/29.
//

import UIKit

class HomeCategoryCell: UICollectionViewCell {
    
     lazy var ImgView : UIImageView  =  {
      let mlocImgView = UIImageView()
        mlocImgView.contentMode = .scaleAspectFill
         mlocImgView.image = UIImage(named: "Home_adr")
        return mlocImgView
        
    }()
   lazy var textLab : UILabel = {
        
       let mlocCity = UILabel()
       mlocCity.textAlignment = .center
       mlocCity.font = UIFont.systemFont(ofSize: ScaleValue(12))
       mlocCity.textColor = TextBlackColor
       mlocCity.text = "文字打印"
       return mlocCity
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
        self.contentView.addSubview(textLab)
        ImgView.snp.makeConstraints { make in
            make.width.height.equalTo(ScaleValue(60))
            make.top.equalToSuperview().offset(ScaleValue(10))
            make.centerX.equalToSuperview()

        }
        textLab.snp.makeConstraints { make in
            make.width.equalTo(ScaleValue(70))
            make.top.equalTo(ImgView.snp_bottom).offset(ScaleValue(10))
            make.centerX.equalToSuperview()
            make.height.equalTo(ScaleValue(20))
            

        }
    }
    
    
    
    
}
