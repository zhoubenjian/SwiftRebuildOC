//
//  FootballFieldVC.swift
//  SwiftRebuildOC
//
//  Created by 周本健 on 2021/5/8.
//  Copyright © 2021 com.Personal.Benjamin. All rights reserved.
//

import UIKit

class FootballFieldVC: BaseVC {
    
    var mainView: FootballFieldView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "FootballField"
        self.view.backgroundColor = .white
        
        self.createUI()
    }
    

    func createUI() {
        
        self.mainView = FootballFieldView()
        self.view.addSubview(self.mainView)
        
        
        
        self.mainView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

}
