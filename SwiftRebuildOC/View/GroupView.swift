//
//  GroupView.swift
//  SwiftRebuildOC
//
//  Created by Benjamin on 2020/5/15.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import SnapKit

class GroupView: UIView {
    
    var groupTB: UITableView!
    
    var titleArray: [String]!
    var dataDic: Dictionary<Int, [String]>!
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.createViewUI()
    }
    
    func createViewUI() {
        
        self.groupTB = UITableView.init(frame: .zero, style: .plain)
        self.groupTB.backgroundColor = .white
        self.groupTB.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.groupTB.tableFooterView = UIView.init(frame: .zero)
        self.groupTB.showsVerticalScrollIndicator = false
        self.groupTB.delegate = self
        self.groupTB.dataSource = self
        self.addSubview(self.groupTB)
        

        
        self.groupTB.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
    }
    
    // 加载数据
    func loadData(titleArray: [String], dataDic: Dictionary<Int, [String]>) {
        self.titleArray = titleArray
        self.dataDic = dataDic
        // 刷新
        self.groupTB.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UITableView  delegate & dataSource
extension GroupView: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - 分组数
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataDic.count
    }
    
    // MARK: - Header标题
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.titleArray[section]
    }
    
    // MARK: - Footer标题
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return ""
    }
    
    // MARK: - 每组行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data: [String] = self.dataDic[section]!
        return data.count
    }
    
    // MARK: - 每行内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "group"
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: identifier)
            cell.selectionStyle = .none
        }
        let data: [String] = self.dataDic[indexPath.section]!
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    // MARK: - 点击效果
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data: [String] = self.dataDic[indexPath.section]!
        PKHUDShow(str: String(format: "%@\n%@", self.titleArray[indexPath.section], data[indexPath.row]))
        print("第\(indexPath.section + 1)组, 第\(indexPath.row + 1)行————\(self.titleArray[indexPath.section]): \(data[indexPath.row])");
    }

}


