//
//  commonCollectionViewCell.swift
//  SwiftRebuildOCDemo
//
//  Created by Benjamin on 2020/5/8.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import SnapKit

class CommonCollectionViewCell: UICollectionViewCell {
    
    var backImgView: UIImageView!
    var titleLabel: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.createViewUI()
    }
    
    func createViewUI() {
        
        self.backImgView = UIImageView()
        self.backImgView?.backgroundColor = .orange
        self.addSubview(self.backImgView)
        
        self.titleLabel = UILabel()
        self.backImgView.addSubview(self.titleLabel)
        
        
        
        self.backImgView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.width.greaterThanOrEqualTo(0)
            make.height.greaterThanOrEqualTo(0)
            make.left.equalTo(self.backImgView.snp.left).offset(10)
            make.top.equalTo(self.backImgView.snp.top).offset(10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
