//
//  SectionView.swift
//  SwiftRebuildOC
//
//  Created by 周本健 on 2020/5/20.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import SnapKit

class SectionView: UIView {
    
    var cv: UICollectionView!
    // 懒加载
    lazy var layout: UICollectionViewFlowLayout = {() -> UICollectionViewFlowLayout in
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (SCREENWIDTH - 30) / 2, height: (SCREENWIDTH - 30) / 2 / 0.618)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.headerReferenceSize = CGSize.init(width: SCREENWIDTH, height: 50)
        return layout
    }()
    
    var titleArray: [String]!
    var dataDic: Dictionary<Int, Int>!
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.createViewUI()
    }
    
    func createViewUI() {
        
        self.cv = UICollectionView.init(frame: .zero, collectionViewLayout: self.layout)
        self.cv.backgroundColor = .white
        // 注册item
        self.cv.register(CommonCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "common")
        // 注册header
        self.cv.register(SectionHeaderView.classForCoder(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        self.cv.delegate = self
        self.cv.dataSource = self
        self.addSubview(self.cv)
        
    
        
        self.cv.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    // 加载数据
    func loadData(titleArray: [String], dataDic: Dictionary<Int, Int>) {
        self.titleArray = titleArray
        self.dataDic = dataDic
        // 刷新
        self.cv.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.titleArray.count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{
        return CGSize(width: SCREENWIDTH, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var header: SectionHeaderView! = SectionHeaderView()
        if kind == UICollectionView.elementKindSectionHeader {
            
            header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as? SectionHeaderView
            
            let title: String! = self.titleArray[indexPath.section]
            var color: UIColor!
            if "purple" == self.titleArray[indexPath.section] {
                color = .purple
            } else if "blue" == self.titleArray[indexPath.section] {
                color = .blue
            } else if "orange" == self.titleArray[indexPath.section] {
                color = .orange
            } else if "green" == self.titleArray[indexPath.section] {
                color = .green
            } else if "red" == self.titleArray[indexPath.section] {
                color = .red
            }

            labelProperty(label: header.titleLabel, bgColor: .clear, bgColorStr: "", textStr: title, textColor: color, textColorStr: "", textFont: 20.0, textAlignment: .left)
        }
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count: Int = self.dataDic[section]!
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CommonCollectionViewCell! = collectionView.dequeueReusableCell(withReuseIdentifier: "common", for: indexPath) as? CommonCollectionViewCell
        
        cell.backImgView.backgroundColor = .clear
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 5
        
        if "purple" == self.titleArray[indexPath.section] {
            cell.backImgView.backgroundColor = .purple
        } else if "blue" == self.titleArray[indexPath.section] {
            cell.backImgView.backgroundColor = .blue
        } else if "orange" == self.titleArray[indexPath.section] {
            cell.backImgView.backgroundColor = .orange
        } else if "green" == self.titleArray[indexPath.section] {
            cell.backImgView.backgroundColor = .green
        } else if "red" == self.titleArray[indexPath.section] {
            cell.backImgView.backgroundColor = .red
        }
        return cell;
    }
    
}
