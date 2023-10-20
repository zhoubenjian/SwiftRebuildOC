//
//  PieChartsView.swift
//  SwiftRebuildOC
//
//  Created by Benjamin on 2020/8/4.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import Charts

class PieChartsView: UIView {
    
    var pieChartsView: PieChartView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.createViewUI()
    }
    
    func createViewUI() {
        
        self.pieChartsView = PieChartView()
        self.addSubview(self.pieChartsView)
        self.pieChartsView.backgroundColor = .white
        self.pieChartsView.setExtraOffsets(left: 40, top: 10, right: 40, bottom: 30)   // 设置这块饼的位置
        self.pieChartsView.chartDescription?.text = "2017年世界各主要经济体占比"           // 描述文字
        self.pieChartsView.chartDescription?.font = UIFont.systemFont(ofSize: 12)
        self.pieChartsView.chartDescription?.textColor = UIColor.black
        
        self.pieChartsView .usePercentValuesEnabled = true                             // 转化为百分比
        // 把拖拽效果关了
//        pieChartView.dragDecelerationEnabled = false
        self.pieChartsView.drawEntryLabelsEnabled = true                               // 显示区块文本
        self.pieChartsView.entryLabelFont = UIFont.systemFont(ofSize: 10)              // 区块文本的字体
        self.pieChartsView.entryLabelColor = UIColor.white
        self.pieChartsView.drawSlicesUnderHoleEnabled = true
        
        self.pieChartsView.drawHoleEnabled = true                                       // 这个饼是空心的
        self.pieChartsView.holeRadiusPercent = 0.382                                    // 空心半径黄金比例
        self.pieChartsView.holeColor = UIColor.white                                    // 空心颜色设置为白色
        self.pieChartsView.transparentCircleRadiusPercent = 0.5                         // 半透明空心半径
        
        self.pieChartsView.drawCenterTextEnabled = true                                 // 显示中心文本
        self.pieChartsView.centerText = "饼状图"                                         // 设置中心文本,你也可以设置富文本`centerAttributedText`
        
        //图例样式设置
        self.pieChartsView.legend.maxSizePercent = 1                                    // 图例的占比
        self.pieChartsView.legend.form = .circle                                        // 图示：原、方、线
        self.pieChartsView.legend.formSize = 8                                          // 图示大小
        self.pieChartsView.legend.formToTextSpace = 4                                   // 文本间隔
        self.pieChartsView.legend.font = UIFont.systemFont(ofSize: 8)
        self.pieChartsView.legend.textColor = UIColor.gray
        self.pieChartsView.legend.horizontalAlignment = .left
        self.pieChartsView.legend.verticalAlignment = .top
        self.pieChartsView.animate(xAxisDuration: 1.0, yAxisDuration: 1.0, easingOption: .easeInBack)
        
        
        
        self.pieChartsView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func drawPieChartsView(pieTitles: [String], pieData: [Double]) {
        
        var dataEntries = [PieChartDataEntry]()
        for i in 0..<pieTitles.count {
            let entry = PieChartDataEntry.init(value: pieData[i], label: pieTitles[i])
            dataEntries.append(entry)
        }
        
        let dataSet = PieChartDataSet.init(entries: dataEntries, label: "占比")
        
        dataSet.colors = [.blue, .red, .green, .black, .brown] // 设置名称和数据的位置 都在内就没有折线了
        dataSet.xValuePosition = .insideSlice
        dataSet.yValuePosition = .outsideSlice
        dataSet.sliceSpace = 1                          // 相邻块距离
        dataSet.selectionShift = 6.66                   // 选中方法半径
        
        //指示折线样式
        dataSet.valueLinePart1OffsetPercentage = 0.8    // 折线中第一段起始位置相对于区块的偏移量, 数值越大, 折线距离区块越远
        dataSet.valueLinePart1Length = 0.8              // 折线中第一段长度占比
        dataSet.valueLinePart2Length = 0.4              // 折线中第二段长度最大占比
        dataSet.valueLineWidth = 1                      // 折线的粗细
        dataSet.valueLineColor = UIColor.brown          // 折线颜色
        
        let data = PieChartData.init(dataSets: [dataSet])
        data.setValueFont(UIFont.systemFont(ofSize: 10.0))
        data.setValueTextColor(UIColor.lightGray)
        self.pieChartsView.data = data
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
