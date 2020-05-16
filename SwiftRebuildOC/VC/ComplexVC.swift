//
//  SnapVC.swift
//  SwiftRebuildOCDemo
//
//  Created by 周本健 on 2020/5/9.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit

class ComplexVC: BaseVC {
    
    var mainView: ComplexView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "complexVC"
        
        self.view.backgroundColor = .white
        self.createUI()
    }
    
    func createUI() {
        
        self.mainView = ComplexView();
        self.view.addSubview(self.mainView)
        self.mainView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

}
