//
//  SimpleCalculatorVC.swift
//  SwiftRebuildOC
//
//  Created by 周本健 on 2020/5/26.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import SnapKit

class SimpleCalculatorVC: BaseVC {
    
    var mainView: SimpleCalculatorView!
    
    // 操作数组
    var operateArray: Array<String>!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "简易计算器"
        self.view.backgroundColor = .white
        self.operateArray = ["+", "-", "*", "/", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        self.createUI()
    }
    
    func createUI() {
        
        self.mainView = SimpleCalculatorView()
        self.view.addSubview(self.mainView)
        
        
        
        self.mainView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        
        
        self.mainView.loadData(operateArray: self.operateArray)
    }
    
}
