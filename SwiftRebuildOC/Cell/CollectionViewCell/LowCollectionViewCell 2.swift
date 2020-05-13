//
//  LowCollectionViewCell.swift
//  SwiftRebuildOCDemo
//
//  Created by 周本健 on 2020/5/9.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import SnapKit

class LowCollectionViewCell: UICollectionViewCell {
    
    var lowImgView: UIImageView!
    var label: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.createCellUI()
    }
    
    func createCellUI() {
        
        self.lowImgView = UIImageView()
        self.lowImgView.backgroundColor = .blue
        self.addSubview(self.lowImgView)
        
        self.label = UILabel()
        self.lowImgView.addSubview(self.label)
        
        
        
        self.lowImgView.snp.makeConstraints { (make) in
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
