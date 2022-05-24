//
//  HomeListCell.swift
//  TYLM
//
//  Created by Mac on 2022/4/29.
//

import UIKit

class HomeListCell: UICollectionViewCell {
    
    lazy var boxView : UIView = {
        let mlboxView = UIView()
        mlboxView.layer.cornerRadius = ScaleValue(10)
        mlboxView.layer.masksToBounds  = true
        mlboxView.backgroundColor = .white
        return mlboxView
        
    }()
    lazy var ImgView : UIImageView  =  {
     let mlocImgView = UIImageView()
       mlocImgView.contentMode = .scaleToFill
        mlocImgView.image = UIImage(named: "Home_Banner_3")
       return mlocImgView
       
   }()
    
    lazy var textLab : UILabel = {
         
        let mloclab = UILabel()
        mloclab.textAlignment = .left
        mloclab.font = UIFont.systemFont(ofSize: ScaleValue(14))
        mloclab.textColor = TextBlackColor
        mloclab.numberOfLines = 2
        mloclab.text = "文字打印"
        return mloclab
     }()
    
    lazy var priceLab : UILabel = {
         
        let mloclab = UILabel()
        mloclab.textAlignment = .left
        mloclab.font = UIFont.systemFont(ofSize: ScaleValue(18))
        mloclab.textColor = BaseColor
        mloclab.numberOfLines = 2
        mloclab.text = "¥200.0"
        return mloclab
     }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

extension HomeListCell {
    func initUI(){
        self.contentView.addSubview(boxView)
        boxView.addSubview(ImgView)
        boxView.addSubview(textLab)
        boxView.addSubview(priceLab)
        boxView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        ImgView.snp.makeConstraints { make in
            make.width.equalTo(ScaleValue(140))
            make.top.equalToSuperview().offset(ScaleValue(10))
            make.height.equalTo(ScaleValue(160))
            make.centerX.equalToSuperview()
        }
        
        textLab.snp.makeConstraints { make in
            make.width.equalTo(ScaleValue(140))
            make.top.equalTo(ImgView.snp_bottom).offset(ScaleValue(10))
            make.centerX.equalToSuperview()
            
        }
        
        priceLab.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(ScaleValue(10))
            make.trailing.equalToSuperview().offset(-ScaleValue(10))
            make.top.equalTo(textLab.snp_bottom).offset(ScaleValue(10))
        }
        
    }
}
