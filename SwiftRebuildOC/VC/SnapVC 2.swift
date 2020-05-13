//
//  SnapVC.swift
//  SwiftRebuildOCDemo
//
//  Created by 周本健 on 2020/5/9.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit

class SnapVC: BaseVC {
    
    var mainView: SnapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "SnapVC"
        
        self.view.backgroundColor = .white
        self.createUI()
    }
    
    func createUI() {
        
        self.mainView = SnapView();
        self.view.addSubview(self.mainView)
        self.mainView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

}
