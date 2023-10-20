//
//  SwipeDeleteView.swift
//  SwiftRebuildOC
//
//  Created by Benjamin on 2020/11/12.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit

class SwipeDeleteView: UIView {
    
    var sv: UIScrollView!
    var contentView: UIView!
    var tb: UITableView!
    
    var dataArray: [String]!
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.createViewUI()
    }
    
    func createViewUI() {
        
        self.sv = UIScrollView.init(frame: .zero)
        self.sv.backgroundColor = .white
        self.addSubview(self.sv)
        
        self.contentView = UIView.init(frame: .zero)
        self.contentView.backgroundColor = .white
        self.sv.addSubview(self.contentView)
        
        self.tb = UITableView.init(frame: .zero)
        self.tb.backgroundColor = .white
        self.tb.isScrollEnabled = false
        self.tb.showsVerticalScrollIndicator = false
        self.tb.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.tb.tableFooterView = UIView.init(frame: .zero)
        /*** 观察者 ***/
        self.tb.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions(rawValue: 0), context: nil)
        /*** 观察者 ***/
        self.tb.delegate = self
        self.tb.dataSource = self
        self.contentView.addSubview(self.tb)
        
        
        
        self.sv.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.greaterThanOrEqualTo(0)
        }
        
        self.tb.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func loadData(dataArray: [String]) {
        self.dataArray = dataArray
        
        // 刷新tb
        self.tb.reloadData()
    }
    
    // MARK: - 重写观察者
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        // 更新tb约束
        self.tb.snp.makeConstraints { (make) in
            make.height.greaterThanOrEqualTo(self.tb.contentSize.height)
        }
        
    }
    
    // MARK: - 销毁观察者
    deinit {
        self.tb.removeObserver(self, forKeyPath: "contentSize")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - UITableView Delegate & DataSource
extension SwipeDeleteView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "sd"
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell.init(style: .value1, reuseIdentifier: identifier)
            cell.selectionStyle = .none
        }
        let president: String = self.dataArray[indexPath.row]
        labelProperty(label: cell.textLabel!, bgColor: .white, bgColorStr: "", textStr: "\(indexPath.row + 1). \(NSString(format: "%@", president))", textColor: .brown, textColorStr: "", textFont: 15.0, textAlignment: .left)
        return cell;
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.dataArray.remove(at: indexPath.row)
            self.tb.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "DELETE"
    }
    
}
