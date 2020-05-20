//
//  SectionVC.swift
//  SwiftRebuildOC
//
//  Created by 周本健 on 2020/5/20.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import SnapKit

class SectionVC: UIViewController {
    
    var mainView: SectionView!
    
    var titleArray: [String]!
    var dataDic: Dictionary<Int, Int>!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "SectionVC"
        self.view.backgroundColor = .white
        
        self.titleArray = ["purple", "blue", "orange", "green", "red"]
        self.dataDic = [
            0: 2,
            1: 3,
            2: 5,
            3: 7,
            4: 11
        ];
        self.createUI()
    }
    
    func createUI() {
        
        self.mainView = SectionView()
        self.mainView.loadData(titleArray: self.titleArray, dataDic: self.dataDic)
        self.view.addSubview(self.mainView)
        self.mainView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

}
