//
//  GroupView.swift
//  SwiftRebuildOC
//
//  Created by 周本健 on 2020/5/15.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import SnapKit

class GroupView: UIView {
    
    var sv: UIScrollView!
    var cv: UIView!
    var groupTB: UITableView!
    var groupCV: UICollectionView!
    // 懒加载
    lazy var layout: UICollectionViewFlowLayout = {() -> UICollectionViewFlowLayout in
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (SCREENWIDTH - 30) / 2, height: (SCREENWIDTH - 30) / 2 / 0.618)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        return layout
    }()
    
    
    var titleDic: Dictionary<Int, String>!
    var dataDic: Dictionary<Int, [String]>!
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.createViewUI()
    }
    
    func createViewUI() {
        
        self.sv = UIScrollView()
        self.sv.backgroundColor = .white
        self.addSubview(self.sv)

        self.cv = UIView()
        self.cv.backgroundColor = .white
        self.sv.addSubview(self.cv)
        
        self.groupTB = UITableView.init(frame: .zero, style: .grouped)
        self.groupTB.isScrollEnabled = false                // 禁止滑动
        self.groupTB.showsVerticalScrollIndicator = false   // 隐藏滑动条
        self.groupTB.backgroundColor = .white
        self.groupTB.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        // 注册
        self.groupTB.register(HomeTableViewCell.classForCoder(), forCellReuseIdentifier: "group")
        // 观察者
        self.groupTB.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions(rawValue: 0), context: nil)
        self.groupTB.delegate = self
        self.groupTB.dataSource = self
        self.cv.addSubview(self.groupTB)
        
        self.groupCV = UICollectionView.init(frame: .zero, collectionViewLayout: self.layout)
        self.groupCV.backgroundColor = .purple
        self.groupCV.delegate = self
        self.groupCV.dataSource = self
        // 注册
        self.groupCV.register(CommonCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "common")
        // 观察者
        self.groupCV.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions(rawValue: 0), context: nil)
        self.cv.addSubview(self.groupCV)
        
        
        
        self.sv.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        self.cv.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.greaterThanOrEqualTo(0)
        }
        
        self.groupTB.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.greaterThanOrEqualTo(0)
        }
        
        self.groupCV.snp.makeConstraints { (make) in
            make.top.equalTo(self.groupTB.snp_bottom)
            make.height.greaterThanOrEqualTo(0)
            make.bottom.left.right.equalToSuperview()
        }
    }
    
    // 加载数据
    func loadData(titleDic: Dictionary<Int, String>, dataDic: Dictionary<Int, [String]>) {
        self.titleDic = titleDic
        self.dataDic = dataDic
        self.groupTB.reloadData()
        self.groupCV.reloadData()
    }
    
    // 重写观察者方法
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        // 更新groupTB约束
        self.groupTB.snp.makeConstraints { (make) in
            make.height.greaterThanOrEqualTo(self.groupTB.contentSize.height)
        }
        
        // 更新groupCV
        self.groupCV.snp.makeConstraints { (make) in
            make.height.greaterThanOrEqualTo(self.groupCV.contentSize.height)
        }
    }
    
    // 销毁观察者
    deinit {
        self.groupTB.removeObserver(self, forKeyPath: "contentSize")
        self.groupCV.removeObserver(self, forKeyPath: "contentSize")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UITableView  delegate & dataSource
extension GroupView: UITableViewDelegate, UITableViewDataSource {
    
    // 分组数
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataDic.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view: UIView! = UIView()
        view.backgroundColor = .lightGray
        let label: UILabel! = UILabel()
        labelProperty(label: label, bgColor: .clear, bgColorStr: "", textStr: self.titleDic[section]!, textColor: .darkGray, textColorStr: "", textFont: 15.0, textAlignment: .left)
        label.font = .boldSystemFont(ofSize: 15.0)
        view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.width.greaterThanOrEqualTo(0)
            make.height.equalToSuperview()
            make.left.equalTo(view.snp_left)
            make.centerY.equalToSuperview()
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        UIView.init(frame: .zero)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.titleDic[section]!
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return ""
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data: [String] = self.dataDic[section]!
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: HomeTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "group", for: indexPath) as? HomeTableViewCell
        if cell == nil {
            cell = HomeTableViewCell.init(style: .default, reuseIdentifier: "group")
            cell.selectionStyle = .none
        }
        let data: [String] = self.dataDic[indexPath.section]!
        labelProperty(label: cell.titleLabel, bgColor: .white, bgColorStr: "", textStr: data[indexPath.row], textColor: .black, textColorStr: "", textFont: 15.0, textAlignment: .center)
        return cell
    }

}

// MARK: - UICollectionView  delegate & dataSource
extension GroupView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CommonCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "common", for: indexPath) as! CommonCollectionViewCell
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 10
        cell.backgroundColor = .orange
        return cell
    }
    
}

//// MARK: - UIScrollView  delegate
//extension GroupView: UIScrollViewDelegate {
//
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        // 组头高度
//        let sectionHeadHeight: CGFloat = 30
//        
//        if scrollView.contentOffset.y > 0 && scrollView.contentOffset.y <= sectionHeadHeight {
//            scrollView.contentInset = UIEdgeInsets(top: scrollView.contentOffset.y, left: 0, bottom: 0, right: 0)
//        } else {
//            scrollView.contentInset = UIEdgeInsets(top: sectionHeadHeight, left: 0, bottom: 0, right: 0)
//        }
//    }
//}
