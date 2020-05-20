//
//  SectionHeaderView.swift
//  SwiftRebuildOC
//
//  Created by 周本健 on 2020/5/20.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import SnapKit

class SectionHeaderView: UICollectionReusableView {
    
    var titleLabel: UILabel!
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .lightGray
        self.createView()
    }
    
    func createView() {
        
        self.titleLabel = UILabel()
        self.addSubview(self.titleLabel)
        
        
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.width.greaterThanOrEqualTo(0)
            make.height.equalTo(30)
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
