//
//  PieChartsVC.swift
//  SwiftRebuildOC
//
//  Created by 周本健 on 2020/8/4.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import Charts

class PieChartsVC: BaseVC {
    
    var mainView: PieChartsView!
    
    let pieTitles: [String] = ["USA", "CHN", "JPN", "DEU", "Other"]
    let pieData: [Double] = [23.89, 15.86, 5.78, 4.66, 49.81]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "PieChartsVC"
        self.view.backgroundColor = .white
        
        self.create()
    }

    
    func create() {
        
        self.mainView = PieChartsView()
        self.mainView.drawPieChartsView(pieTitles: self.pieTitles, pieData: self.pieData)
        self.view.addSubview(self.mainView)
        
        
        
        self.mainView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    

}
