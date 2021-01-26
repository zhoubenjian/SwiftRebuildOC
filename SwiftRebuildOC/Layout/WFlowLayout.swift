//
//  WFlowLayout.swift
//  WaterFlowLayout
//
//  Created by Benjamin on 2020/5/6.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit

class WFlowLayout: UICollectionViewFlowLayout {
    
    weak open var delegate: WFlowLayoutDelegate?
    fileprivate let defaultColumnCount: Int = 3         // 列数
    fileprivate let defaultColumnMargin: CGFloat = 10   // 列间距
    fileprivate let defaultRowMargin: CGFloat = 10      // 行间距
    fileprivate let defaultEdgeInsets: UIEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)    // 默认边距
    
    /*懒加载创建存放属性的数组*/
    fileprivate lazy var attrs: [UICollectionViewLayoutAttributes] = []
    // 列高度数组
    fileprivate lazy var columnHeights: [CGFloat] = []
    // 内容高度
    fileprivate var contentHeight: CGFloat?
    
    // MARK: - 列数
    fileprivate func columnCount() -> Int {
        if self.delegate != nil && (self.delegate?.responds(to: #selector(self.delegate?.hw_columnCountInWaterFlowLayout(layout:))))! {     // 判断代理是否实现 实现走代理方法
            return (self.delegate?.hw_columnCountInWaterFlowLayout!(layout: self))!
        } else {    // 没有实现走默认
            return defaultColumnCount
        }
    }
    
    // MARK: - 列间距
    fileprivate func columnMargin() -> CGFloat {
        if self.delegate != nil && (self.delegate?.responds(to: #selector(self.delegate?.hw_columnMarginInWaterFlowLayout(layout:))))! {
            return (self.delegate?.hw_columnMarginInWaterFlowLayout!(layout: self))!
        } else {
            return defaultColumnMargin
        }
    }
    
    // MARK: - 行间距
    fileprivate func rowMargin() -> CGFloat {
        if self.delegate != nil && (self.delegate?.responds(to: #selector(self.delegate?.hw_rowMarginInWaterFlowLayout(layout:))))! {
            return (self.delegate?.hw_rowMarginInWaterFlowLayout!(layout: self))!
        } else {
            return defaultRowMargin
        }
    }
    
    // MARK: - 边距
    fileprivate func edgeInsets() -> UIEdgeInsets {
        if self.delegate != nil && (self.delegate?.responds(to: #selector(self.delegate?.hw_edgeInsetsInWaterFlowLayout(layout:))))! {
            return (self.delegate?.hw_edgeInsetsInWaterFlowLayout!(layout: self))!
        } else {
            return defaultEdgeInsets
        }
    }
    
    
    // 准备所有View的LayoutAttribute信息
    override func prepare() {
        super.prepare()
        
        if self.collectionView == nil {
            return
        }
        
        // 清除列高度数组
        self.columnHeights.removeAll()
        // 清除高度内容
        self.contentHeight = 0
        
        for _ in 0..<self.columnCount() {
            self.columnHeights.append(self.edgeInsets().top)
        }
        // 清除属性
        self.attrs.removeAll()
        // 获取数组
        let count: Int = (self.collectionView?.numberOfItems(inSection: 0))!
        // 获取宽度
        let width: CGFloat = (self.collectionView?.frame.size.width)!
        // 获取列间距总和
        let columnMargin: CGFloat = (CGFloat)(self.columnCount() - 1) * self.columnMargin()
        // 计算cell宽度
        let cellWidth: CGFloat = (width - self.edgeInsets().left - self.edgeInsets().right - columnMargin) / CGFloat(self.columnCount())
        
        for i in 0..<count {
            let indexPath: NSIndexPath = NSIndexPath(item: i, section: 0)
            let attr: UICollectionViewLayoutAttributes = UICollectionViewLayoutAttributes(forCellWith: indexPath as IndexPath)
            
            // 获取高度
            let cellHeight: CGFloat = (self.delegate?.hw_setCellHeight(layouyt: self, indexPath: indexPath as NSIndexPath, itemWidth: cellWidth))!
            // 默认最小高度为第一组
            var minColumnHeight: CGFloat = self.columnHeights[0]
            var minColumn: Int = 0
            // 筛选最小高度的组
            for i in 1..<self.columnCount() {
                let colHeight = self.columnHeights[i]
                if colHeight < minColumnHeight {
                    minColumnHeight = colHeight
                    minColumn = i
                }
            }
            // 将下一个cell添加在最小高度的那一组
            let cellX: CGFloat = self.edgeInsets().left + CGFloat(minColumn) * (self.columnMargin() + cellWidth)
            var cellY: CGFloat = minColumnHeight
            if cellY != self.edgeInsets().top {     // 如果不是第一次加入需要加上行间距
                cellY = self.rowMargin() + cellY
            }
            // 设置frame
            attr.frame = CGRect(x: cellX, y: cellY, width: cellWidth, height: cellHeight)
            // 那么当前的最大Y值是新加的这个Cell的底部
            let maxY = cellY + cellHeight
            
            // 修改改组的列高度
            self.columnHeights[minColumn] = maxY
            // 比较当前的最大高度是否大于内容高度的
            let maxContentHeight: CGFloat = self.columnHeights[minColumn]
            if CGFloat(self.contentHeight!) < CGFloat(maxContentHeight) {
                // 大于修改内容高度
                self.contentHeight = maxContentHeight
            }
            // 添加属性
            self.attrs.append(attr)
        }
    }
    
    // 返回属性数组
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return self.attrs
    }
    
    // 返回内容高度
    override var collectionViewContentSize: CGSize {
        get {
            return CGSize(width: 0, height: CGFloat(self.contentHeight!) + CGFloat(self.edgeInsets().bottom))
        }
        set {
            self.collectionViewContentSize = newValue
        }
    }
}

@objc protocol WFlowLayoutDelegate: NSObjectProtocol {
    // 返回高度
    func hw_setCellHeight(layouyt: WFlowLayout, indexPath: NSIndexPath, itemWidth: CGFloat) -> CGFloat
    // 返回行数
    @objc optional func hw_columnCountInWaterFlowLayout(layout: WFlowLayout) -> Int
    // 返回列间距
    @objc optional func hw_columnMarginInWaterFlowLayout(layout: WFlowLayout) -> CGFloat
    // 返回行间距
    @objc optional func hw_rowMarginInWaterFlowLayout(layout: WFlowLayout) -> CGFloat
    // 返回边距
    @objc optional func hw_edgeInsetsInWaterFlowLayout(layout: WFlowLayout) -> UIEdgeInsets
}
