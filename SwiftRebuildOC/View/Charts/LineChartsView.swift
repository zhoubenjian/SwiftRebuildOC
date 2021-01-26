//
//  LineChartsView.swift
//  SwiftRebuildOC
//
//  Created by Benjamin on 2020/8/3.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import Charts

class LineChartsView: UIView {
    
    var lineChart: LineChartView!
    
    var months: [String]!
    var unitSold: [Double]!
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.createViewUI()
    }
    
    func createViewUI() {
        
        self.lineChart = LineChartView()
        self.addSubview(self.lineChart)
        
        
        
        self.lineChart.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.bottomMargin.equalTo(0)
        }
    }
    
    // 设置数据
    func setCharts(dataPoints: [String], values: [Double]) {
        
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        let lineChartDataSet = LineChartDataSet(entries: dataEntries, label: "万元")
        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        // 加上一个界限
        let jx = ChartLimitLine(limit: 12.0, label: "I am LimitLine")
        lineChart.rightAxis.addLimitLine(jx)
        lineChart.data = lineChartData
        // 自定义颜色
        lineChartDataSet.colors = [UIColor.red]
        lineChartDataSet.colors = ChartColorTemplates.colorful()
        lineChart.animate(xAxisDuration: 1.0, easingOption: .easeInBounce)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
