//
//  RadarChartVC.swift
//  SwiftRebuildOC
//
//  Created by 周本健 on 2020/7/30.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import Charts

class ChartsVC: BaseVC {
    
    var mainView: ChartsView!
    
    var chartsArray = ["RadarCharts(雷达图)", "LineCharts(折线图)", "PieCharts(饼图)"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "RadarChartVC";
        self.view.backgroundColor = .white
        

        self.createUI()
    }
    
    
    func createUI() {
        
        self.mainView = ChartsView();
        self.mainView.loadData(dataArray: self.chartsArray)
        self.view.addSubview(self.mainView)
        
        
        
        self.mainView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        
        
        self.mainView.radarChartsClosures = {
            
            let rcVC: RadarChartsVC = RadarChartsVC()
            self.navigationController?.pushViewController(rcVC, animated: true)
            
        };
        
        self.mainView.lineChartsClosure = {
          
            let lcVC: LineChartsVC = LineChartsVC()
            self.navigationController?.pushViewController(lcVC, animated: true)
            
        };
        
        self.mainView.pieChartsClosure = {
            
            let pcVC: PieChartsVC = PieChartsVC()
            self.navigationController?.pushViewController(pcVC, animated: true)
            
        };
    }
}
