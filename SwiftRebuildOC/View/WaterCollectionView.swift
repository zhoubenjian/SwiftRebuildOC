//
//  WaterCollectionView.swift
//  SwiftRebuildOCDemo
//
//  Created by 周本健 on 2020/5/9.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit

class WaterCollectionView: UIView {
    
    var waterCollectionView: UICollectionView!
    // 懒加载waterFlowLayout
    lazy var waterFlowLayout: WFlowLayout = {
        () -> WFlowLayout in
        let waterFlowLayout = WFlowLayout()
        waterFlowLayout.scrollDirection = .vertical
        waterFlowLayout.delegate = self
        return waterFlowLayout
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.createViewUI()
    }
    
    func createViewUI() {
        
        self.waterCollectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: self.waterFlowLayout)
        self.waterCollectionView.backgroundColor = .purple
        /*** 注册 ***/
        self.waterCollectionView.register(HighCollectionViewCell.self, forCellWithReuseIdentifier: "high")
        self.waterCollectionView.register(LowCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "low")
        /*** 注册 ***/
        self.waterCollectionView.delegate = self
        self.waterCollectionView.dataSource = self
        self.addSubview(self.waterCollectionView)
        self.waterCollectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - UICollectionView deleagte & dataSource
extension WaterCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row % 2 == 0 || indexPath.row % 3 == 0 {
            
            let cell: LowCollectionViewCell! = collectionView.dequeueReusableCell(withReuseIdentifier: "low", for: indexPath) as? LowCollectionViewCell
            labelProperty(label: cell.label, bgColor: .clear, bgColorStr: "", textStr: String(format: "%d", indexPath.row), textColor: .black, textColorStr: "", textFont: 13.0, textAlignment: .left)
            return cell
            
        } else {
            
            let cell: HighCollectionViewCell! = collectionView.dequeueReusableCell(withReuseIdentifier: "high", for: indexPath) as? HighCollectionViewCell
            labelProperty(label: cell.label, bgColor: .clear, bgColorStr: "", textStr: String(format: "%d", indexPath.row), textColor: .black, textColorStr: "", textFont: 13.0, textAlignment: .left)
            return cell
            
        }
    }
    
}

// MARK: - WFlowLayoutDelegate deleagte
extension WaterCollectionView: WFlowLayoutDelegate {
    
    // 列数(此方法未重写，则默认3列)
    func hw_columnCountInWaterFlowLayout(layout: WFlowLayout) -> Int {
        return 2
    }
    
    // 高度
    func hw_setCellHeight(layouyt: WFlowLayout, indexPath: NSIndexPath, itemWidth: CGFloat) -> CGFloat {
        if indexPath.row % 2 == 0 || indexPath.row % 3 == 0 {
            return 145
        } else {
            return 300
        }
    }
    
}
