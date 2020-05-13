//
//  DefaultView.swift
//  SwiftRebuildOCDemo
//
//  Created by 周本健 on 2020/5/8.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import SnapKit

class DefaultView: UIView {
    
    var defauleTableView: UITableView!
    var str: String!
    var poemArray: [String]!
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.createViewUI()
    }
    
    func createViewUI() {
        
        self.defauleTableView = UITableView.init(frame: CGRect.zero, style: .plain)
        self.defauleTableView.backgroundColor = .white
        self.defauleTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.defauleTableView.tableFooterView = UIView.init(frame: CGRect.zero)
        /*** 系统自带cell样式不需要注册 ***/
        // 自定义cell需要注册
        self.defauleTableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "common")
        self.defauleTableView.register(AdaptiveTableViewCell.classForCoder(), forCellReuseIdentifier: "adapt")
        self.defauleTableView.delegate = self
        self.defauleTableView.dataSource = self
        self.defauleTableView.estimatedRowHeight = 50                           // 默认高度
        self.defauleTableView.rowHeight = UITableView.automaticDimension        // 自适应高度
        self.addSubview(self.defauleTableView)
        
        self.defauleTableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    // 加载数据
    func loadData(str: String) {
        if !str.isEmpty {
            self.str = str
            // 刷新
            self.defauleTableView.reloadData()
        }
    }
    
    func loadData(poemArray: [String]) {
        if poemArray.count > 0 {
            self.poemArray = poemArray
            // 刷新
            self.defauleTableView.reloadData()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - UITableView deleagte & dataSource
extension DefaultView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (self.str as NSString).isEqual(to: "value1") {
            
            let id = "value1"
            var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: id)
            if cell == nil {
                cell = UITableViewCell.init(style: .value1, reuseIdentifier: id)
                cell.selectionStyle = .none
                cell.accessoryType = .disclosureIndicator
            }
            cell.imageView?.image = UIImage.init(named: "wx")
            labelProperty(label: cell.textLabel!, bgColor: .white, bgColorStr: "", textStr: self.str, textColor: .blue, textColorStr: "", textFont: 13.0, textAlignment: .left)
            labelProperty(label: cell.detailTextLabel!, bgColor: .white, bgColorStr: "", textStr: getCurrentTime(), textColor: .purple, textColorStr: "", textFont: 13.0, textAlignment: .left)
            return cell
            
        } else if (self.str as NSString).isEqual(to: "value2") {
            
            let id = "value2"
            var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: id)
            if cell == nil {
                cell = UITableViewCell.init(style: .value2, reuseIdentifier: id)
                cell.selectionStyle = .none
                cell.accessoryType = .detailButton
            }
            labelProperty(label: cell.textLabel!, bgColor: .white, bgColorStr: "", textStr: self.str, textColor: .blue, textColorStr: "", textFont: 13.0, textAlignment: .left)
            labelProperty(label: cell.detailTextLabel!, bgColor: .white, bgColorStr: "", textStr: getCurrentTime(), textColor: .purple, textColorStr: "", textFont: 13.0, textAlignment: .left)
            return cell
            
        } else if (self.str as NSString).isEqual(to: "subtitle") {
            
            let id = "subtitle"
            var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: id)
            if cell == nil {
                cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: id)
                cell.selectionStyle = .none
                cell.accessoryType = .detailDisclosureButton
            }
            cell.imageView?.image = UIImage.init(named: "wx")
            labelProperty(label: cell.textLabel!, bgColor: .white, bgColorStr: "", textStr: self.str, textColor: .blue, textColorStr: "", textFont: 13.0, textAlignment: .left)
            labelProperty(label: cell.detailTextLabel!, bgColor: .white, bgColorStr: "", textStr: getCurrentTime(), textColor: .purple, textColorStr: "", textFont: 13.0, textAlignment: .left)
            return cell
            
        } else if (self.str as NSString).isEqual(to: "default") {
            
            let id = "default"
            var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: id)
            if cell == nil {
                cell = UITableViewCell.init(style: .default, reuseIdentifier: id)
                cell.selectionStyle = .none
                cell.accessoryType = .checkmark
            }
            cell.imageView?.image = UIImage.init(named: "wx")
            labelProperty(label: cell.textLabel!, bgColor: .white, bgColorStr: "", textStr: self.str, textColor: .blue, textColorStr: "", textFont: 13.0, textAlignment: .left)
            return cell
            
        } else if (self.str as NSString).isEqual(to: "adaptiveTableView") {
            
            let id = "adapt"
            var cell: AdaptiveTableViewCell! = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as? AdaptiveTableViewCell
            if cell == nil {
                cell = AdaptiveTableViewCell.init(style: .default, reuseIdentifier: id)
                cell.selectionStyle = .none
            }
            labelProperty(label: cell.txtLabel, bgColor: .white, bgColorStr: "", textStr: self.poemArray[indexPath.row], textColor: .black, textColorStr: "", textFont: 15.0, textAlignment: .center)
            return cell
            
        }
        
        return UITableViewCell();
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        PKHUDShow(str: self.str)
    }
    
}
