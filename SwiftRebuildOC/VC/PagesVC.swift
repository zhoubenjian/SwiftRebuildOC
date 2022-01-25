//
//  PagesVC.swift
//  SwiftRebuildOC
//
//  Created by Benjamin on 2022/1/25.
//  Copyright © 2022 com.Personal.Benjamin. All rights reserved.
//

import UIKit

class PagesVC: BaseVC {
    
    var mainView: PagesView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "PagesVC"
        
        self.createUI()
    }
    
    func createUI() {
        
        self.mainView = PagesView()
        self.view.addSubview(self.mainView)
        
        
        
        self.mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
