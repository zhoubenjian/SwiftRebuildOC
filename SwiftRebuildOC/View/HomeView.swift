//
//  HomeView.swift
//  SwiftRebuildOCDemo
//
//  Created by Benjamin on 2020/5/7.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit

class HomeView: UIView {
    
    var homeTableView: UITableView!
    var dataArray: [String]!
    
    
    typealias SkipToTVClosures = (String) -> ()
    var skipToTVClosures: SkipToTVClosures!
    
    typealias SkipToCVClosures = (String) -> ()
    var skipToCVClosures: SkipToCVClosures!
    
    typealias SkipToCXClosures = () -> ()
    var skipToCXClosures: SkipToCXClosures!
    
    typealias SkipToGVClosures = () -> Void
    var skipToGVClosures: SkipToGVClosures!
    
    typealias SkipToSDClosures = () -> ()
    var skipToSDClosures: SkipToSDClosures!
    
    typealias SkipToSVClosures = () -> Void
    var skipToSVClosures: SkipToSVClosures!
    
    typealias SkipToGalleryVClosures = () -> Void
    var skipToGalleryVClosures: SkipToGalleryVClosures!
    
    typealias SkipToSCVClosures = () -> Void
    var skipToSCVClosures: SkipToSCVClosures!
    
    typealias SkipToWVVCClosures = () -> Void
    var skipToWVVCClosures: SkipToWVVCClosures!
    
    typealias SkipToChartsVCClosures = () -> Void
    var skipToChartsVCClosures: SkipToChartsVCClosures!
    
    typealias SkipToAntForestVCClosures = () -> Void
    var skipToAntForestVCClosures: SkipToAntForestVCClosures!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.createViewUI()
    }
    
    func createViewUI() {
        
        self.homeTableView = UITableView()
        self.homeTableView.backgroundColor = .white
        self.homeTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)  // 补全分割线
        self.homeTableView.tableFooterView = UIView.init(frame: CGRect.zero)                    // 隐藏无数据行分割线
        // 注册
        self.homeTableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "identifier")
        self.homeTableView.delegate = self
        self.homeTableView.dataSource = self
        self.addSubview(self.homeTableView)
        self.homeTableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    // 加载数据
    func loadData(dataArray: [String]) {
        if dataArray.count > 0 {
            self.dataArray = dataArray
            // 刷新
            self.homeTableView.reloadData()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UITableView delegate & dataSource
extension HomeView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: HomeTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath) as? HomeTableViewCell
        if cell == nil {
            cell = HomeTableViewCell.init(style: .default, reuseIdentifier: "identifier")
        }
        cell.selectionStyle = .none
        labelProperty(label: cell.titleLabel, bgColor: .white, bgColorStr: "", textStr: self.dataArray[indexPath.row], textColor: .black, textColorStr: "", textFont: 15.0, textAlignment: .center)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell: HomeTableViewCell! = tableView.cellForRow(at: indexPath) as? HomeTableViewCell
        
        switch indexPath.row  {
        
        case 0...4:
            self.skipToTVClosures(cell.titleLabel.text!)
            
        case 5...6:
            self.skipToCVClosures(cell.titleLabel.text!)
            
        case 7:
            self.skipToCXClosures()
            
        case 8:
            self.skipToGVClosures()
            
        case 9:
            self.skipToSDClosures()
            
        case 10:
            self.skipToSVClosures()
            
        case 11:
            self.skipToGalleryVClosures()
            
        case 12:
            self.skipToSCVClosures()
            
        case 13:
            self.skipToWVVCClosures()
            
        case 14:
            self.skipToChartsVCClosures()
            
        case 15:
            self.skipToAntForestVCClosures()
            
        default:
            break
            
        }
        
    }
}
