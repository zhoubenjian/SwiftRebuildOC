//
//  PageRequsetView.swift
//  SwiftRebuildOC
//
//  Created by Benjamin on 2022/1/20.
//  Copyright © 2022 com.Personal.Benjamin. All rights reserved.
//

import UIKit

class PageRequsetView: UIView {
    
    var sv: UIScrollView!
    var contentView: UIView!
    var tv: UITableView!
    
    var list: [UserBalanceRecord]!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 初始化
        self.list = Array<UserBalanceRecord>()
        
        self.createViewUI()
    }
    
    func createViewUI() {
        
        self.sv = UIScrollView.init(frame: .zero)
        self.sv.backgroundColor = .white
        self.addSubview(self.sv)
        
        self.contentView = UIView()
        self.contentView.backgroundColor = .white
        self.sv.addSubview(self.contentView)
        
        self.tv = UITableView.init(frame: .zero, style: .plain)
        self.tv.backgroundColor = .white
        self.tv.isScrollEnabled = false                                             // 禁止滑动
        self.tv.showsVerticalScrollIndicator = false                                // 隐藏滑动条
        self.tv.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // 补全分割线
        self.tv.tableFooterView = UIView.init(frame: .zero)
        // 注册自定义cell
        self.tv.register(UserBalanceRecordTableViewCell.self, forCellReuseIdentifier: "record")
        // 注册自定义cell
        self.tv.delegate = self
        self.tv.dataSource = self
        self.tv.estimatedRowHeight = 70.0                                            // 默认高度
        /** 观察者 **/
        self.tv.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions(rawValue: 0), context: nil)
        /** 观察者 **/
        self.contentView.addSubview(self.tv)
        
        
        
        self.sv.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.greaterThanOrEqualTo(0)
        }
        
        self.tv.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
    
    // 加载数据
    func loadData(list: [UserBalanceRecord]) {
        
        self.list = list
        
        // 刷新UITableView
        self.tv.reloadData()
    }
    
    
    
    // MARK: - 重写观察者
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        // 更新tv约束
        self.tv.snp.makeConstraints { (make) in
            make.height.greaterThanOrEqualTo(self.tv.contentSize.height)
        }
    }
    
    // MARK: - 销毁观察者
    deinit {
        self.tv.removeObserver(self, forKeyPath: "contentSize")
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension PageRequsetView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let id = "record"
        var cell: UserBalanceRecordTableViewCell! = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as? UserBalanceRecordTableViewCell
        if cell == nil {
            cell = UserBalanceRecordTableViewCell.init(style: .default, reuseIdentifier:id)
        }
        
        cell.selectionStyle = .none
        // 加载数据
        cell.loadCellData(userBalanceRecord: self.list[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
}
