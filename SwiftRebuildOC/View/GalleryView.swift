//
//  GalleryView.swift
//  SwiftRebuildOC
//
//  Created by 周本健 on 2020/5/25.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import SnapKit

class GalleryView: UIView {
    
    var GalleryCollectionView: UICollectionView!
    
    // 懒加载
    lazy var layout: GalleryLayout = {() -> GalleryLayout in
        let layout = GalleryLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 262, height: 430)
        layout.sectionInset = UIEdgeInsets(top: 35, left: (SCREENWIDTH - 262) / 2, bottom: 38, right: (SCREENWIDTH - 262) / 2)
        layout.minimumLineSpacing = 30
        return layout
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.createViewUI()
    }
    
    func createViewUI() {
        
        self.GalleryCollectionView = UICollectionView.init(frame: .zero, collectionViewLayout: self.layout)
        self.GalleryCollectionView.backgroundColor = .white
        self.GalleryCollectionView.showsHorizontalScrollIndicator = false       // 隐藏滑动条
        /*** border ***/
        self.GalleryCollectionView.layer.borderWidth = 0.3;
        self.GalleryCollectionView.layer.borderColor = colorWithHex(hexColorStr: "#999999").cgColor
        /*** border ***/
        self.GalleryCollectionView.register(GalleryCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "gallery")
        self.GalleryCollectionView.delegate = self
        self.GalleryCollectionView.dataSource = self
        self.addSubview(self.GalleryCollectionView)
        
        
        
        self.GalleryCollectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - UICollectionView delegate & dataSource
extension GalleryView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: GalleryCollectionViewCell! = collectionView.dequeueReusableCell(withReuseIdentifier: "gallery", for: indexPath) as? GalleryCollectionViewCell
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 5
        switch indexPath.row {
        case 0:
            cell.img.backgroundColor = .orange
        case 1:
            cell.img.backgroundColor = .green
        case 2:
            cell.img.backgroundColor = .blue
        case 3:
            cell.img.backgroundColor = .red
        case 4:
            cell.img.backgroundColor = .purple
        default:
            break
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        PKHUDShow(str: "第\(indexPath.row + 1)张")
    }
}
