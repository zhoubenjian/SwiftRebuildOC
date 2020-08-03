//
//  RadarView.swift
//  SwiftRebuildOC
//
//  Created by 周本健 on 2020/7/31.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import Charts

class RadarChartsView: UIView {
    
    var chart: RadarChartView!
    
    var activities: [String]!
    var radarChartsDataArray: [RadarChartDataSet]!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    func createViewUI() {
        
        self.chart = RadarChartView()
        self.chart.backgroundColor = .clear
        // 上边距
        self.chart.extraTopOffset = 50
        // 设置多个dataset
        self.chart.data = RadarChartData(dataSets: self.radarChartsDataArray)
        self.chart.xAxis.labelPosition = .bottom
        // 下面的提示按钮不显示 none 为不显示下面的提示
        // circle 圆圈
        self.chart.legend.form = .circle
        // 显示的位置
        self.chart.legend.horizontalAlignment = .center
        // 重绘边边角角的文本
        self.chart.xAxis.valueFormatter = self
        self.addSubview(chart)
        
        
        
        self.chart.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        
        
        // 自定义样式
        for i in 0..<self.radarChartsDataArray.count {
            
            if i == 0 {
                
                self.radarChartsDataArray[i].setColor(.green)
                self.radarChartsDataArray[i].fillColor = .green
                
            } else if (i == 1) {
                
                self.radarChartsDataArray[i].setColor(.red)
                self.radarChartsDataArray[i].fillColor = .red
                
            } else if (i == 2) {
                
                self.radarChartsDataArray[i].setColor(.purple)
                self.radarChartsDataArray[i].fillColor = .purple
                
            }
            
            self.radarChartsDataArray[i].lineWidth = 2
            self.radarChartsDataArray[i].fillAlpha = 0.2;
            self.radarChartsDataArray[i].drawFilledEnabled = true;
        }
    }
    
    // 加载数据
    func loadData(activities: [String], radarChartsDataArray: [RadarChartDataSet]) {
        
        self.activities = activities
        self.radarChartsDataArray = radarChartsDataArray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - IAxisValueFormatter
extension RadarChartsView : IAxisValueFormatter {
    // 维度标签文字（X轴文字）
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return activities[Int(value) % activities.count]
    }
}
