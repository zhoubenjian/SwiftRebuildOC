//
//  FootballFieldTableViewCell.swift
//  SwiftRebuildOC
//
//  Created by 周本健 on 2021/5/8.
//  Copyright © 2021 com.Personal.Benjamin. All rights reserved.
//

import UIKit

class FootballFieldTableViewCell: UITableViewCell {
    
    var sectionView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .white
        self.createCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createCellUI() {
        
        self.sectionView = UIView()
        self.addSubview(self.sectionView)
        
        
        
        self.sectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
}
