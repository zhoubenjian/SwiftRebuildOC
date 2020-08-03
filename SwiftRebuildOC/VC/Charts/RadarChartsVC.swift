//
//  RadarChartsVC.swift
//  SwiftRebuildOC
//
//  Created by 周本健 on 2020/7/31.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import Charts

class RadarChartsVC: BaseVC {
    
    var mainView: RadarChartsView!
    
    let activities = ["仁", "义", "礼", "智", "信"]
    let greenDataSet = RadarChartDataSet(
        entries: [
            RadarChartDataEntry(value: 210),
            RadarChartDataEntry(value: 60.0),
            RadarChartDataEntry(value: 150.0),
            RadarChartDataEntry(value: 160.0),
            RadarChartDataEntry(value: 110.0)
        ],
        label: "刘备"
    )
    let redDataSet = RadarChartDataSet(
        entries: [
            RadarChartDataEntry(value: 120.0),
            RadarChartDataEntry(value: 160.0),
            RadarChartDataEntry(value: 110.0),
            RadarChartDataEntry(value: 210.0),
            RadarChartDataEntry(value: 100.0)
        ],
        label: "曹操"
    )
    let purpleDataSet = RadarChartDataSet(
        entries: [
            RadarChartDataEntry(value: 210.0),
            RadarChartDataEntry(value: 200.0),
            RadarChartDataEntry(value: 210.0),
            RadarChartDataEntry(value: 230.0),
            RadarChartDataEntry(value: 220.0)
        ],
        label: "诸葛亮"
    )
    
    var radarChartsDataArray: [RadarChartDataSet]!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "RadarChartsVC";
        self.view.backgroundColor = .white
        
        self.radarChartsDataArray = [self.greenDataSet, self.redDataSet, self.purpleDataSet]
        self.createUI();
    }
    
    func createUI() {
        
        self.mainView = RadarChartsView()
        self.mainView.loadData(activities: self.activities, radarChartsDataArray: self.radarChartsDataArray)
        self.mainView.createViewUI()
        self.view.addSubview(self.mainView)
        
        
        
        self.mainView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

}

