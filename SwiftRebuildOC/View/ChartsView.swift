//
//  ChartsView.swift
//  SwiftRebuildOC
//
//  Created by 周本健 on 2020/7/31.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit

class ChartsView: UIView {
    
    var chartsTableView: UITableView!
    var dataArray: [String]!
    
    typealias RadarChartsClosures = () -> ()
    var radarChartsClosures: RadarChartsClosures!
    typealias LineChartsClosure = () -> ()
    var lineChartsClosure: LineChartsClosure!
    typealias PieChartsClosure = () -> ()
    var pieChartsClosure: PieChartsClosure!
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.createViewUI()
    }
    
    func createViewUI() {
        
        self.chartsTableView = UITableView()
        self.chartsTableView.backgroundColor = .white
        self.chartsTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)  // 补全分割线
        self.chartsTableView.tableFooterView = UIView.init(frame: CGRect.zero)                    // 隐藏无数据行分割线
        self.addSubview(chartsTableView)
        // 注册
        self.chartsTableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "identifier")
        self.chartsTableView.delegate = self
        self.chartsTableView.dataSource = self
        
        
        
        self.chartsTableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    // 加载数据
    func loadData(dataArray: [String]) {
        if dataArray.count > 0 {
            self.dataArray = dataArray
            // 刷新
            self.chartsTableView.reloadData()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - UITableView  delegate & dataSource
extension ChartsView : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: HomeTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath) as? HomeTableViewCell
        if cell == nil {
            cell = HomeTableViewCell.init(style: .default, reuseIdentifier: "identifier")
        }
        cell.selectionStyle = .none
        labelProperty(label: cell.titleLabel, bgColor: .white, bgColorStr: "", textStr: self.dataArray[indexPath.row], textColor: .black, textColorStr: "", textFont: 15.0, textAlignment: .center)
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            // RadarCharts
            self.radarChartsClosures()
            
        } else if indexPath.row == 1 {
            
            // lineCharts
            self.lineChartsClosure()
            
        } else if indexPath.row == 2 {
            
            // pieCharts
            self.pieChartsClosure()
            
        }
    }
    
}
