//
//  LineChartVC.swift
//  SwiftRebuildOC
//
//  Created by 周本健 on 2020/8/3.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import Charts

class LineChartsVC: BaseVC {
    
    var mainView: LineChartsView!
    
    let months = ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"]
    let unitSold = [150, 195, 205, 190, 210, 200, 220.0, 49.0, 60.0, 300.0, 182.0, 106.0]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "LineChartsVC"
        self.view.backgroundColor = .white
        
        self.createUI()
    }
    
    func createUI() {
        
        self.mainView = LineChartsView()
        self.mainView.setCharts(dataPoints: self.months, values: self.unitSold)
        self.view.addSubview(self.mainView)
        
        
        
        self.mainView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

}
