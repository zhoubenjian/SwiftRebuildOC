//
//  FootballFieldView.swift
//  SwiftRebuildOC
//
//  Created by Benjamin on 2021/5/8.
//  Copyright © 2021 com.Personal.Benjamin. All rights reserved.
//

import UIKit

class FootballFieldView: UIView {
    
    var footballFieldTableView: UITableView!
    var smallForbiddenAreaView1: UIView!        // 小禁区(上方，18.32m * 5.5m)
    var bigForbiddenAreaView1: UIView!          // 大禁区(上方，40.32m * 16.5m)
    var goalView1: UIView!                      // 球门(上方，2.44m * 7.32m)
    var pointView1: UIView!                     // 点球点(上方，距离门线11m)
    var centerCircleView: UIView!
    var centerPointView: UIView!
    var smallForbiddenAreaView2: UIView!        // 小禁区(下方，18.32m * 5.5m)
    var bigForbiddenAreaView2: UIView!          // 大禁区(下方，40.32m * 16.5m)
    var goalView2: UIView!                      // 球门(下方，2.44m * 7.32m)
    var pointView2: UIView!                     // 点球点(下方，距离门线11m)
    
    
    var tableViewHeight: CGFloat!
    var cellHeight: CGFloat!
    var cornersView: CornersView!
    
    
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
        
        self.smallForbiddenAreaView1 = UIView()
        self.smallForbiddenAreaView1.layer.borderWidth = 1.5
        self.smallForbiddenAreaView1.layer.borderColor = UIColor.white.cgColor
        self.footballFieldTableView.addSubview(self.smallForbiddenAreaView1)
        
        self.bigForbiddenAreaView1 = UIView()
        self.bigForbiddenAreaView1.layer.borderWidth = 1.5
        self.bigForbiddenAreaView1.layer.borderColor = UIColor.white.cgColor
        self.footballFieldTableView.addSubview(self.bigForbiddenAreaView1)
        
        self.goalView1 = UIView()
        self.goalView1.layer.borderWidth = 1.5
        self.goalView1.layer.borderColor = UIColor.black.cgColor;
        self.footballFieldTableView.addSubview(self.goalView1)
        
        self.pointView1 = UIView()
        self.pointView1.layer.cornerRadius = 2
        self.pointView1.backgroundColor = .white
        self.bigForbiddenAreaView1.addSubview(self.pointView1)
        
        self.centerCircleView = UIView()
        self.centerCircleView.layer.cornerRadius = SCREENWIDTH / 65 * 9.15 / 2      // 圆角
        self.centerCircleView.layer.borderWidth = 2
        self.centerCircleView.layer.borderColor = UIColor.white.cgColor
        self.footballFieldTableView.addSubview(self.centerCircleView)
        
        self.centerPointView = UIView()
        self.centerPointView.layer.cornerRadius = 2
        self.centerPointView.backgroundColor = .white
        self.centerCircleView.addSubview(self.centerPointView)
        
        self.smallForbiddenAreaView2 = UIView()
        self.smallForbiddenAreaView2.layer.borderWidth = 1.5
        self.smallForbiddenAreaView2.layer.borderColor = UIColor.white.cgColor
        self.footballFieldTableView.addSubview(self.smallForbiddenAreaView2)
        
        self.bigForbiddenAreaView2 = UIView()
        self.bigForbiddenAreaView2.layer.borderWidth = 1.5
        self.bigForbiddenAreaView2.layer.borderColor = UIColor.white.cgColor
        self.footballFieldTableView.addSubview(self.bigForbiddenAreaView2)
        
        self.goalView2 = UIView()
        self.goalView2.layer.borderWidth = 1.5
        self.goalView2.layer.borderColor = UIColor.black.cgColor;
        self.footballFieldTableView.addSubview(self.goalView2)

        self.pointView2 = UIView()
        self.pointView2.layer.cornerRadius = 2
        self.pointView2.backgroundColor = .white
        self.bigForbiddenAreaView1.addSubview(self.pointView2)
        
        
        
        self.smallForbiddenAreaView1.snp.makeConstraints { (make) in
            make.width.equalTo(SCREENWIDTH / 65 * 18.32)
            make.height.equalTo(SCREENWIDTH / 65 * 5.5)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        self.bigForbiddenAreaView1.snp.makeConstraints { (make) in
            make.width.equalTo(SCREENWIDTH / 65 * 40.32)
            make.height.equalTo(SCREENWIDTH / 65 * 16.5)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        self.goalView1.snp.makeConstraints { (make) in
            make.width.equalTo(SCREENWIDTH / 65 * 7.32)
            make.height.equalTo(SCREENWIDTH / 65 * 2.44)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        self.pointView1.snp.makeConstraints { (make) in
            make.width.height.equalTo(4)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.bigForbiddenAreaView1.snp.top).offset(SCREENWIDTH / 65 * 11)
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
        
        self.smallForbiddenAreaView2.snp.makeConstraints { (make) in
            make.width.equalTo(SCREENWIDTH / 65 * 18.32)
            make.height.equalTo(SCREENWIDTH / 65 * 5.5)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.footballFieldTableView.snp.top).offset(self.tableViewHeight)
        }
        
        self.bigForbiddenAreaView2.snp.makeConstraints { (make) in
            make.width.equalTo(SCREENWIDTH / 65 * 40.32)
            make.height.equalTo(SCREENWIDTH / 65 * 16.5)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.footballFieldTableView.snp.top).offset(self.tableViewHeight)
        }
        
        self.goalView2.snp.makeConstraints { (make) in
            make.width.equalTo(SCREENWIDTH / 65 * 7.32)
            make.height.equalTo(SCREENWIDTH / 65 * 2.44)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.footballFieldTableView.snp.top).offset(self.tableViewHeight)
        }

        self.pointView2.snp.makeConstraints { (make) in
            make.width.height.equalTo(4)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.footballFieldTableView.snp.top).offset(self.tableViewHeight - SCREENWIDTH / 65 * 11)
        }
    }
    
    func createCorners() {
        
        /*** 创建角球区域 ***/
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
            // 取消选中样式
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



