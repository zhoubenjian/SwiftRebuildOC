//
//  SimpleCalculatorCollectionViewCell.swift
//  SwiftRebuildOC
//
//  Created by 周本健 on 2020/5/26.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import SnapKit

class SimpleCalculatorCollectionViewCell: UICollectionViewCell {
    
    var operateLabel: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.createCellUI()
    }
    
    func createCellUI() {
        
        self.operateLabel = UILabel()
//        self.operateLabel.layer.borderWidth = 1
//        self.operateLabel.layer.backgroundColor = colorWithHex(hexColorStr: "#F2F2F2").cgColor
        self.addSubview(self.operateLabel)
        
        
        
        self.operateLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
