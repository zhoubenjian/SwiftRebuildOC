//
//  AntForestVC.swift
//  SwiftRebuildOC
//
//  Created by 周本健 on 2021/4/14.
//  Copyright © 2021 com.Personal.Benjamin. All rights reserved.
//

import UIKit

class AntForestVC: BaseVC {
    
    var mainView: AntForestView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "AntForest"
        self.view.backgroundColor = .white
        
        self.createUI()
    }
    
    func createUI()  {
        
        self.mainView = AntForestView()
        self.view.addSubview(self.mainView)
        
        
        
        self.mainView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview();
        }
    }

}
