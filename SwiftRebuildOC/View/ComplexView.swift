//
//  SnapView.swift
//  SwiftRebuildOCDemo
//
//  Created by Benjamin on 2020/5/9.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import SnapKit

class ComplexView: UIView {
    
    var sv: UIScrollView!
    var contentView: UIView!
    var hLabel: UILabel! = UILabel()
    var hcv: UICollectionView!
    var tLabel: UILabel! = UILabel()
    var tb: UITableView!
    var vLabel: UILabel! = UILabel()
    var vcv: UICollectionView!
    
    // 懒加载
    lazy var hLayout: UICollectionViewFlowLayout = {() -> UICollectionViewFlowLayout in
        let hLayout = UICollectionViewFlowLayout()
        hLayout.scrollDirection = .horizontal
        let SIDEWIDTH: Int = (Int)(SCREENWIDTH - 40) / 3    // 横向滑动CollectionView的item边长
        hLayout.itemSize = CGSize(width: SIDEWIDTH, height: SIDEWIDTH)
        hLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        hLayout.minimumLineSpacing = 10         // 与滑动方向一致的item间距
        return hLayout
    }()
    
    lazy var vLayout: UICollectionViewFlowLayout = {() -> UICollectionViewFlowLayout in
        let vLayout = UICollectionViewFlowLayout()
        vLayout.scrollDirection = .vertical
        vLayout.itemSize = CGSize(width: (SCREENWIDTH - 30) / 2, height: (SCREENWIDTH - 30) / 2)
        vLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        vLayout.minimumLineSpacing = 10         // 与滑动方向一致的item间距
        vLayout.minimumInteritemSpacing = 10    // 与滑动方向垂直的item间距
        return vLayout
    }()
    
    
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
        
        labelProperty(label: self.hLabel, bgColor: .white, bgColorStr: "", textStr: "水平滑动CollectionView", textColor: .black, textColorStr: "", textFont: 18.0, textAlignment: .left)
        self.contentView.addSubview(self.hLabel)
        
        self.hcv = UICollectionView.init(frame: .zero, collectionViewLayout: self.hLayout)
        self.hcv.backgroundColor = .green
        self.hcv.showsHorizontalScrollIndicator = false     // 隐藏滑动条
        // 注册
        self.hcv.register(CommonCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "hcv")
        self.hcv.delegate = self
        self.hcv.dataSource = self
        self.contentView.addSubview(self.hcv)
        
        labelProperty(label: self.tLabel, bgColor: .white, bgColorStr: "", textStr: "TableView", textColor: .black, textColorStr: "", textFont: 18.0, textAlignment: .left)
        self.contentView.addSubview(self.tLabel)
        
        self.tb = UITableView.init(frame: .zero)
        self.tb.backgroundColor = .white
        self.tb.isScrollEnabled = false                     // 禁止滑动
        self.tb.showsVerticalScrollIndicator = false        // 隐藏滑动条
        self.tb.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.tb.tableFooterView = UIView.init(frame: .zero)
        /*** 观察者 ***/
        self.tb.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions(rawValue: 0), context: nil)
        /*** 观察者 ***/
        self.tb.delegate = self
        self.tb.dataSource = self
        self.contentView.addSubview(self.tb)
        
        labelProperty(label: self.vLabel, bgColor: .white, bgColorStr: "", textStr: "竖直滑动CollectionView", textColor: .black, textColorStr: "", textFont: 18.0, textAlignment: .left)
        self.contentView.addSubview(self.vLabel)
        
        self.vcv = UICollectionView.init(frame: .zero, collectionViewLayout: self.vLayout)
        self.vcv.backgroundColor = .purple
        self.vcv.isScrollEnabled = false                    // 禁止滑动
        self.vcv.showsVerticalScrollIndicator = false       // 隐藏滑动条
        // 注册
        self.vcv.register(CommonCollectionViewCell.self, forCellWithReuseIdentifier: "vcv")
        /*** 观察者 ***/
        self.vcv.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions(rawValue: 0), context: nil)
        /*** 观察者 ***/
        self.vcv.delegate = self
        self.vcv.dataSource = self
        self.contentView.addSubview(self.vcv)
        
        
        
        self.sv.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.greaterThanOrEqualTo(0)
        }
        
        self.hLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView).offset(20)
            make.width.height.greaterThanOrEqualTo(0)
            make.centerX.equalToSuperview()
        }
        
        self.hcv.snp.makeConstraints { (make) in
            make.top.equalTo(self.hLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
            make.height.equalTo((SCREENWIDTH - 40) / 3 + 20)
        }
        
        self.tLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.hcv.snp.bottom).offset(20)
            make.width.height.greaterThanOrEqualTo(0)
            make.centerX.equalToSuperview()
        }
        
        self.tb.snp.makeConstraints { (make) in
            make.top.equalTo(self.tLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
            make.height.greaterThanOrEqualTo(0)
        }
        
        self.vLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.tb.snp.bottom).offset(20)
            make.width.height.greaterThanOrEqualTo(0)
            make.centerX.equalToSuperview()
        }
        
        self.vcv.snp.makeConstraints { (make) in
            make.top.equalTo(self.vLabel.snp.bottom).offset(10)
            make.height.greaterThanOrEqualTo(0)
            make.bottom.left.right.equalToSuperview()
        }
    }
    
    // 重写观察者方法
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        // 更新hcv约束
        self.tb.snp.makeConstraints { (make) in
            make.height.greaterThanOrEqualTo(self.tb.contentSize.height)
        }
        
        // 更新vcv约束
        self.vcv.snp.makeConstraints { (make) in
            make.top.greaterThanOrEqualTo(self.hcv.snp.bottom).offset(self.tb.contentSize.height + 10)
            make.height.greaterThanOrEqualTo(self.vcv.contentSize.height)
        }
    }
    
    // 销毁观察者
    deinit {
        self.tb.removeObserver(self, forKeyPath: "contentSize")
        self.vcv.removeObserver(self, forKeyPath: "contentSize")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - UITableView  delegate & dateSource
extension ComplexView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "idnetifier")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "idnetifier")
            cell.selectionStyle = .none
        }
        cell.backgroundColor = randomColor()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tb_indexPath.row:\(indexPath.row)")
    }
    
}

// MARK: - UICollectionView delegate & dataSource
extension ComplexView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.isEqual(self.hcv) {
            return 11
        } else if collectionView.isEqual(self.vcv) {
            return 10
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.isEqual(self.hcv) {
            let cell: CommonCollectionViewCell! = collectionView.dequeueReusableCell(withReuseIdentifier: "hcv", for: indexPath) as? CommonCollectionViewCell
            return cell
        } else if collectionView.isEqual(self.vcv) {
            let cell: CommonCollectionViewCell! = collectionView.dequeueReusableCell(withReuseIdentifier: "vcv", for: indexPath) as? CommonCollectionViewCell
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.isEqual(self.hcv) {
            print("水平hcv_indexPath.row:\(indexPath.row)")
        } else if collectionView.isEqual(self.vcv) {
            print("竖直vcv_indexPath.row:\(indexPath.row)")
        }
    }
    
}
