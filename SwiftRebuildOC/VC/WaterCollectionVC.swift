//
//  WaterCollectionVC.swift
//  SwiftRebuildOCDemo
//
//  Created by Benjamin on 2020/5/9.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit

class WaterCollectionVC: BaseVC {
    
    var mainView: WaterCollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "WaterCollectionVC"
        self.view.backgroundColor = .white

        self.createUI()
    }
    
    func createUI() {
        
        self.mainView = WaterCollectionView()
        self.view.addSubview(self.mainView)
        self.mainView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

}
