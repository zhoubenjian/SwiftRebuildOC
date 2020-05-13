//
//  HighCollectionViewCell.swift
//  SwiftRebuildOCDemo
//
//  Created by 周本健 on 2020/5/9.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import SnapKit

class HighCollectionViewCell: UICollectionViewCell {
    
    var highImgView: UIImageView!
    var label: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.createCellUI()
    }
    
    func createCellUI() {
        
        self.highImgView = UIImageView()
        self.highImgView.backgroundColor = .orange
        self.addSubview(self.highImgView)
        
        self.label = UILabel()
        self.highImgView.addSubview(self.label)
        
        
        
        self.highImgView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.label.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
