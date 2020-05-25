//
//  GalleryLayout.swift
//  SwiftRebuildOC
//
//  Created by 周本健 on 2020/5/25.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit

class GalleryLayout: UICollectionViewFlowLayout {
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        let W: CGFloat! = self.collectionView?.bounds.size.width
        let H: CGFloat! = self.collectionView?.bounds.size.height
        
        // 1.确定最终的滑动位置
        var targetP: CGPoint! = super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        // 2.利用滚动位置去拿当前显示的所有元素
        let rect = CGRect(x: targetP.x, y: 0, width: W, height: H)
        let attrs: Array<UICollectionViewLayoutAttributes>! = super.layoutAttributesForElements(in: rect)
        // 3.获取所有滚动元素距离中心点的最小值
        var minDelta: Float = MAXFLOAT
        for attr in attrs {
            let delta: Float = (Float)(attr.center.x - targetP.x - W * 0.5)
            if fabsf(delta) < fabsf(minDelta) {
                minDelta = delta
            }
        }
        // 用最终的偏移量加最小值 形成自动滑动的效果
        targetP.x += CGFloat(minDelta)
        if targetP.x < 0 {
            targetP.x = 0
        }
        return targetP
    }
    
    let ActiveDistance: CGFloat = 350   // 垂直缩放除以系数
    let ScaleFactor: CGFloat = 0.25     // 缩放系数  越大缩放越大
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        // rect范围内的cell视图
        let originarray: Array<UICollectionViewLayoutAttributes>! = super.layoutAttributesForElements(in: rect)
        // 拷贝生成数组
        let array: Array<UICollectionViewLayoutAttributes>! = NSArray.init(array: originarray, copyItems: true) as? Array<UICollectionViewLayoutAttributes>
        
        var visibleRect = CGRect()
        visibleRect.origin = self.collectionView!.contentOffset
        visibleRect.size = self.collectionView!.bounds.size
        
        for attributes in array! {
            let distance = visibleRect.midX - attributes.center.x
            let normalizedDistance = distance / ActiveDistance
            let zoom = 1 - ScaleFactor * (abs(normalizedDistance))
            let alpha = 1 - abs(normalizedDistance)
            // SX：X轴缩放   SY：Y轴缩放
            attributes.transform3D = CATransform3DMakeScale(1.0, zoom, 1.0)
            attributes.alpha = alpha
            attributes.zIndex = 1
        }
        return array
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        // 滑动放大缩小  需要实时刷新layout
        return true
    }
}
