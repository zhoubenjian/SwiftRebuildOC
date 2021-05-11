//
//  FootballFieldView.swift
//  SwiftRebuildOC
//
//  Created by 周本健 on 2021/5/8.
//  Copyright © 2021 com.Personal.Benjamin. All rights reserved.
//

import UIKit

class FootballFieldView: UIView {
    
    var footballFieldTableView: UITableView!
    var smallForbiddenAreaView: UIView!
    var bigForbiddenAreaView: UIView!
    var pointView: UIView!
    var centerCircleView: UIView!
    var centerPointView: UIView!
    
    
    var tableViewHeight: CGFloat!
    var cellHeight: CGFloat!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.tableViewHeight = SCREENWIDTH / STADIOGIUSEPPEMEAZZAWIDTH * STADIOGIUSEPPEMEAZZALENGTH
        self.cellHeight = self.tableViewHeight / 18
        
        self.createViewUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createViewUI() {
        
        self.footballFieldTableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: SCREENWIDTH, height: self.tableViewHeight))
        self.footballFieldTableView.layer.borderWidth = 1.5
        self.footballFieldTableView.layer.borderColor = UIColor.white.cgColor
        self.footballFieldTableView.isScrollEnabled = false                 // 禁止滑动
        self.footballFieldTableView.showsVerticalScrollIndicator = false    // 隐藏滑动条
        self.footballFieldTableView.separatorInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        self.footballFieldTableView.separatorColor = .white
        self.footballFieldTableView.tableFooterView = UIView.init(frame: CGRect.zero)
        // 自定义cell需要注册
        self.footballFieldTableView.register(FootballFieldTableViewCell.classForCoder(), forCellReuseIdentifier: "footballfield")
        self.footballFieldTableView.delegate = self
        self.footballFieldTableView.dataSource = self
        self.addSubview(self.footballFieldTableView)
        
        self.smallForbiddenAreaView = UIView()
        self.smallForbiddenAreaView.layer.borderWidth = 1.5
        self.smallForbiddenAreaView.layer.borderColor = UIColor.white.cgColor
        self.footballFieldTableView.addSubview(self.smallForbiddenAreaView)
        
        self.bigForbiddenAreaView = UIView()
        self.bigForbiddenAreaView.layer.borderWidth = 1.5
        self.bigForbiddenAreaView.layer.borderColor = UIColor.white.cgColor
        self.footballFieldTableView.addSubview(self.bigForbiddenAreaView)
        
        self.pointView = UIView()
        self.pointView.layer.cornerRadius = 2
        self.pointView.backgroundColor = .white
        self.bigForbiddenAreaView.addSubview(self.pointView)
        
        self.centerCircleView = UIView()
        self.centerCircleView.layer.cornerRadius = SCREENWIDTH / 65 * 9.15 / 2      // 圆角
        self.centerCircleView.layer.borderWidth = 2
        self.centerCircleView.layer.borderColor = UIColor.white.cgColor
        self.footballFieldTableView.addSubview(self.centerCircleView)
        
        self.centerPointView = UIView()
        self.centerPointView.layer.cornerRadius = 2
        self.centerPointView.backgroundColor = .white
        self.centerCircleView.addSubview(self.centerPointView)
        
        
        
        self.smallForbiddenAreaView.snp.makeConstraints { (make) in
            make.width.equalTo(SCREENWIDTH / 65 * 18.32)
            make.height.equalTo(SCREENWIDTH / 65 * 5.5)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        self.bigForbiddenAreaView.snp.makeConstraints { (make) in
            make.width.equalTo(SCREENWIDTH / 65 * 40.32)
            make.height.equalTo(SCREENWIDTH / 65 * 16.5)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        self.pointView.snp.makeConstraints { (make) in
            make.width.height.equalTo(4)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.bigForbiddenAreaView.snp.top).offset(SCREENWIDTH / 65 * 11)
        }
        
        self.centerCircleView.snp.makeConstraints { (make) in
            make.width.height.equalTo(SCREENWIDTH / 65 * 9.15)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        self.centerPointView.snp.makeConstraints { (make) in
            make.width.height.equalTo(4)
            make.centerX.centerY.equalToSuperview()
        }
    }
    
}

// MARK: - UITableView  delegate & dataSource
extension FootballFieldView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 18
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: FootballFieldTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "footballfield", for: indexPath) as? FootballFieldTableViewCell
        
        if cell == nil {
            cell = FootballFieldTableViewCell.init(style: .default, reuseIdentifier: "footballfield")
            cell.selectionStyle = .none
        }
        
        // 草皮间色
        if indexPath.row % 2 == 0 {
            
            cell.sectionView.backgroundColor = colorWithHex(hexColorStr: "#228B22");
            
        } else {
            
            cell.sectionView.backgroundColor = colorWithHex(hexColorStr: "#32CD32");
        }
        
        if indexPath.row == 8 {
            
            let centerBottomView: UIView = UIView()
            centerBottomView.backgroundColor = .white
            cell.addSubview(centerBottomView)
            
            centerBottomView.snp.makeConstraints { (make) in
                make.width.equalToSuperview()
                make.height.equalTo(1.5)
                make.centerX.equalToSuperview()
                make.bottom.equalTo(cell.snp.bottom)
            }
        }
        
        if indexPath.row == 9 {
            
            let centerBottomView: UIView = UIView()
            centerBottomView.backgroundColor = .white
            cell.addSubview(centerBottomView)
            
            centerBottomView.snp.makeConstraints { (make) in
                make.width.equalToSuperview()
                make.height.equalTo(1.5)
                make.centerX.equalToSuperview()
                make.bottom.equalTo(cell.snp.top)
            }
        }
        
        return cell
    }
    
}



