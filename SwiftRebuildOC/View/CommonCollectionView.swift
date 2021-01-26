//
//  CommonCollectionView.swift
//  SwiftRebuildOCDemo
//
//  Created by Benjamin on 2020/5/8.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import SnapKit

class CommonCollectionView: UIView {
    
    var commonCollectionView: UICollectionView!
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
    
    var pokerCardArray: [String]!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.createViewUI()
    }
    
    func createViewUI() {
        
        self.commonCollectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: self.layout)
        self.commonCollectionView.backgroundColor = .white
        /*** 注册 ***/
        self.commonCollectionView.register(CommonCollectionViewCell.self, forCellWithReuseIdentifier: "common")
        /*** 注册 ***/
        self.commonCollectionView.delegate = self
        self.commonCollectionView.dataSource = self
        self.addSubview(self.commonCollectionView)
        self.commonCollectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    // 加载数据
    func loadData(pokerCardArray: [String]) {
        if !pokerCardArray.isEmpty {
            self.pokerCardArray = pokerCardArray
            // 刷新
            self.commonCollectionView.reloadData()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UICollectionView deleagte & dataSource
extension CommonCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.pokerCardArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: CommonCollectionViewCell! = collectionView.dequeueReusableCell(withReuseIdentifier: "common", for: indexPath) as? CommonCollectionViewCell
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 10
        labelProperty(label: cell.titleLabel, bgColor: .orange, bgColorStr: "", textStr: self.pokerCardArray[indexPath.row], textColor: .black, textColorStr: "", textFont: 15.0, textAlignment: .left)
        return cell;
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(self.pokerCardArray[indexPath.row])")
        PKHUDShow(str: self.pokerCardArray[indexPath.row])
    }
    
}
