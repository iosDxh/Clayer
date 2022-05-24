//
//  HomeHeaderCell.swift
//  TYLM
//
//  Created by Mac on 2022/4/29.
//

import UIKit

final class HomeHeaderCell: UICollectionViewCell {
    var locBtnView = UIView()
   private lazy var searchView : UIView = {
        let view = UIView ()
        view.backgroundColor = RGBColor(248,248,248)
        view.layer.cornerRadius = 10
        view.layer.masksToBounds  = true
        
        return view
        
    }()

    
    private lazy var bcgImgView : UIImageView  =  {
      let mbcgImgView = UIImageView()
        mbcgImgView.image = UIImage.init(named: "Home_bcgImag")
        mbcgImgView.contentMode = .scaleToFill
        return mbcgImgView
        
    }()
    
    private lazy var locImgView : UIImageView  =  {
      let mlocImgView = UIImageView()
        mlocImgView.image = UIImage.init(named: "Home_downArrow")
        mlocImgView.contentMode = .scaleAspectFit
        
        return mlocImgView
        
    }()
   lazy var locCity : UILabel = {
        
       let mlocCity = UILabel()
       mlocCity.textAlignment = .center
       mlocCity.font = UIFont.systemFont(ofSize: ScaleValue(14))
       mlocCity.textColor = UIColor.white
       mlocCity.text = "定位中"

       return mlocCity
    }()
    
    lazy var bannerView : SDCycleScrollView  = {
        
        let mbannerView = SDCycleScrollView()
        mbannerView.scrollDirection = .horizontal
        mbannerView.autoScrollTimeInterval = 3
        mbannerView.backgroundColor = .white
        mbannerView.layer.cornerRadius  = 10
        mbannerView.layer.masksToBounds = true
        mbannerView.placeholderImage =  UIImage.init(named: "Home_Banner_2")
        mbannerView.contentMode = .scaleAspectFill
        return mbannerView
    
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
}

extension HomeHeaderCell{
    
    func initUI(){
        
        
        
        let contentView = UIView()
        
       
        
        let searchImgView = UIImageView()
        searchImgView.image = UIImage.init(named: "Home_search")
        searchImgView.contentMode = .scaleToFill
        
        let searchLab = UILabel()
        searchLab.textAlignment = .center
        searchLab.font = UIFont.systemFont(ofSize: ScaleValue(16))
        searchLab.textColor = TextDarkGrayColor
        searchLab.text = "请输入您要搜索的内容"
        
        self.contentView.addSubview(bcgImgView)
        bcgImgView.addSubview(locBtnView)
        locBtnView.addSubview(locCity)
        locBtnView.addSubview(locImgView)
        
        bcgImgView.addSubview(searchView)
        searchView.addSubview(contentView)
        contentView.addSubview(searchImgView)
        contentView.addSubview(searchLab)
        
        self.contentView.addSubview(bannerView)
        
        bcgImgView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(ScaleValue(106)+StatusBarHeight)
            
        }
        
        locBtnView.snp.makeConstraints { make in
            make.top.equalTo(ScaleValue(40)+StatusBarHeight)
            make.leading.equalToSuperview()
           
            
        }
        locCity.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(ScaleValue(10))
            make.height.equalTo(ScaleValue(20))
            make.centerY.equalToSuperview()
            make.width.lessThanOrEqualTo(ScaleValue(80))
        }
        locImgView.snp.makeConstraints { make in
            make.size.equalTo(CGSize.init(width: ScaleValue(14), height: ScaleValue(14)))
            make.leading.equalTo(locCity.snp_trailing).offset(ScaleValue(4))
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        searchView.snp.makeConstraints { make in
            make.leading.equalTo(locBtnView.snp_trailing).offset(ScaleValue(10))
            make.trailing.equalToSuperview().offset(-ScaleValue(10))
            make.centerY.equalTo(locBtnView)
            make.height.equalTo(ScaleValue(40))
            
        }
        
        
        contentView.snp.makeConstraints { make in
            
            make.top.bottom.centerX.equalToSuperview()
            make.height.equalTo(ScaleValue(40))
            make.width.lessThanOrEqualTo(ScreenWidth - ScaleValue(134))
        }
        
        searchImgView.snp.makeConstraints { make in
            make.leading.centerY.equalToSuperview()
            make.width.height.equalTo(ScaleValue(14))
            
        }
        searchLab.snp.makeConstraints { make in
            make.leading.equalTo(searchImgView.snp_trailing).offset(ScaleValue(2))
            make.centerY.equalTo(searchImgView)
            make.height.equalTo(ScaleValue(20))
            make.trailing.equalToSuperview().offset(-ScaleValue(10))

            
            
        }
        
       
        
      
        
       
        
        bannerView.snp.makeConstraints { make in

            make.leading.equalToSuperview().offset(ScaleValue(10))
            make.trailing.equalToSuperview().offset(-ScaleValue(10))
            make.top.equalTo(searchView.snp_bottom).offset(ScaleValue(6))
            make.height.equalTo(ScaleValue(200))
        }
        
        
        

        
        


        
        
    }
}
