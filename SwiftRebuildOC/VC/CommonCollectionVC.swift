//
//  CommonCollectionVC.swift
//  SwiftRebuildOCDemo
//
//  Created by 周本健 on 2020/5/8.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import SnapKit

class CommonCollectionVC: BaseVC {
    
    var mainView: CommonCollectionView!
    
    var pokerCardArray: [String]!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "CommonCollectionVC"
        self.view.backgroundColor = .white
        
        self.pokerCardArray = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "Joker"]
        self.createUI()
    }
    
    func createUI() {
        
        self.mainView = CommonCollectionView()
        self.mainView.loadData(pokerCardArray: self.pokerCardArray)
        self.view.addSubview(self.mainView)
        self.mainView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

}
