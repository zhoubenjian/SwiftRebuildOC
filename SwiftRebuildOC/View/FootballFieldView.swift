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
    var smallForbiddenAreaView2: UIView!        // 小禁区(下方，18.32m * 5.5m)
    var bigForbiddenAreaView2: UIView!          // 大禁区(下方，40.32m * 16.5m)
    var goalView2: UIView!                      // 球门(下方，2.44m * 7.32m)
    var pointView2: UIView!                     // 点球点(下方，距离门线11m)
    
    var cornersView1: CornersView!              // 右上方角球（宽度1m的1/4圆弧）
    var cornersView2: CornersView!              // 左上方角球（宽度1m的1/4圆弧）
    var cornersView3: CornersView!              // 左下方角球（宽度1m的1/4圆弧）
    var cornersView4: CornersView!              // 右下方角球（宽度1m的1/4圆弧）
    
    var middleLineView: UIView!                 // 中场线
    var middleFieldCircle: CornersView!         // 中场圆（贝塞尔曲线绘制）
    var midddleFieldPoint: UIView!              // 中场点
    
    
    var tableViewHeight: CGFloat!
    var cellHeight: CGFloat!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.tableViewHeight = SCREENWIDTH / STADIOGIUSEPPEMEAZZAWIDTH * STADIOGIUSEPPEMEAZZALENGTH
        self.cellHeight = self.tableViewHeight / 18
        
        self.createViewUI()
        // 绘制角球区域，中场区域
        self.createCornersMiddle()
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
    
    // 绘制角球区域，中场区域
    func createCornersMiddle() {
        
        // MARK: Corners（角球区）
        self.cornersView1 = CornersView.init(frame: CGRect(x: SCREENWIDTH - 20, y: 0, width: 20, height: 20), circleOfCenter: CGPoint(x: 20, y: 0), radius: 20, startAngle: CGFloat(-1/2 * Double.pi), endAngle: CGFloat(-Double.pi), lineWidth: 1.5, lineColor: .white)
        // 透明色
        self.cornersView1.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.0)
        self.footballFieldTableView.addSubview(self.cornersView1)
        
        self.cornersView2 = CornersView.init(frame: CGRect(x: 0, y: 0, width: 20, height: 20), circleOfCenter: CGPoint(x: 0, y: 0), radius: 20, startAngle: 0, endAngle: CGFloat(-1/2 * Double.pi), lineWidth: 1.5, lineColor: .white)
        // 透明色
        self.cornersView2.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.0)
        self.footballFieldTableView.addSubview(self.cornersView2)
        
        self.cornersView3 = CornersView.init(frame: CGRect(x: 0, y: self.tableViewHeight - 20, width: 20, height: 20), circleOfCenter: CGPoint(x: 0, y: 20), radius: 20, startAngle: CGFloat(-3/2 * Double.pi), endAngle: CGFloat(-2 * Double.pi), lineWidth: 1.5, lineColor: .white)
        // 透明色
        self.cornersView3.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.0)
        self.footballFieldTableView.addSubview(self.cornersView3)
        
        self.cornersView4 = CornersView.init(frame: CGRect(x: SCREENWIDTH - 20, y: self.tableViewHeight - 20, width: 20, height: 20), circleOfCenter: CGPoint(x: 20, y: 20), radius: 20, startAngle: CGFloat(-Double.pi), endAngle: CGFloat(-3/2 * Double.pi), lineWidth: 1.5, lineColor: .white)
        // 透明色
        self.cornersView4.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.0)
        self.footballFieldTableView.addSubview(self.cornersView4)
        
        
        
        // MARK: MiddleField（中场）
        self.middleFieldCircle = CornersView.init(frame: CGRect(x: SCREENWIDTH / 2 - (SCREENWIDTH / 65 * 9.15) - 3, y: self.tableViewHeight / 2 - (SCREENWIDTH / 65 * 9.15) - 3, width: (SCREENWIDTH / 65 * 18.3) + 3, height: (SCREENWIDTH / 65 * 18.3) + 3), circleOfCenter: CGPoint(x: SCREENWIDTH / 65 * 9.15 + 1.5, y: SCREENWIDTH / 65 * 9.15 + 1.5), radius: SCREENWIDTH / 65 * 9.15, startAngle: 0, endAngle: CGFloat(2 * Double.pi), lineWidth: 1.5, lineColor: .white)
        self.middleFieldCircle.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.0)
        self.footballFieldTableView.addSubview(self.middleFieldCircle)
        
        self.middleLineView = UIView()
        self.middleLineView.backgroundColor = .white
        self.footballFieldTableView.addSubview(self.middleLineView)
        
        self.midddleFieldPoint = UIView()
        self.midddleFieldPoint.backgroundColor = .white
        self.midddleFieldPoint.layer.cornerRadius = 2
        self.middleFieldCircle.addSubview(self.midddleFieldPoint)
        
        
        
        self.middleLineView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(1.5)
            make.center.equalToSuperview()
        }
        
        self.midddleFieldPoint.snp.makeConstraints { (make) in
            make.width.height.equalTo(4)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.footballFieldTableView.snp.top).offset(self.tableViewHeight / 2 - 2)
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
            // 取消选中样式
            cell.selectionStyle = .none
        }
        
        // 草皮间色
        if indexPath.row % 2 == 0 {
            
            cell.sectionView.backgroundColor = colorWithHex(hexColorStr: "#228B22");
            
        } else {
            
            cell.sectionView.backgroundColor = colorWithHex(hexColorStr: "#32CD32");
        }
        
//        // 中场半圆（上）
//        if indexPath.row == 8 {
//
//            let centerBottomView: UIView = UIView()
//            centerBottomView.backgroundColor = .white
//            cell.addSubview(centerBottomView)
//
//            centerBottomView.snp.makeConstraints { (make) in
//                make.width.equalToSuperview()
//                make.height.equalTo(1.5)
//                make.centerX.equalToSuperview()
//                make.bottom.equalTo(cell.snp.bottom)
//            }
//        }
//
//        // 中场半圆（下）
//        if indexPath.row == 9 {
//
//            let centerBottomView: UIView = UIView()
//            centerBottomView.backgroundColor = .white
//            cell.addSubview(centerBottomView)
//
//            centerBottomView.snp.makeConstraints { (make) in
//                make.width.equalToSuperview()
//                make.height.equalTo(1.5)
//                make.centerX.equalToSuperview()
//                make.bottom.equalTo(cell.snp.top)
//            }
//        }
        
        return cell
    }
    
}



