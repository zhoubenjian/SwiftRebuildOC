//
//  CornersView.swift
//  SwiftRebuildOC
//
//  Created by Benjamin on 2021/6/29.
//  Copyright © 2021 com.Personal.Benjamin. All rights reserved.
//

import UIKit

/*** UIBezierPath（贝塞尔曲线）绘图 ***/
class CornersView: UIView {
    
    var centerOfCircle: CGPoint!        // 绘制的圆心
    var radius: CGFloat!                // 半径
    var startAngle: CGFloat!            // 开始角度（弧度制）
    var endAngle: CGFloat!              // 结束角度（弧度制）
    var lineWidth: CGFloat!             // 绘制宽度
    var lineColor: UIColor!             // 绘制颜色

    
    // MARK: 自定义初始化方法
    init(frame: CGRect, centerOfCircle: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, lineWidth: CGFloat, lineColor: UIColor) {
        super.init(frame: frame)
        
        // 初始化赋值
        self.centerOfCircle = centerOfCircle
        self.radius = radius
        self.startAngle = startAngle
        self.endAngle = endAngle
        self.lineWidth = lineWidth
        self.lineColor = lineColor
        
        // setNeedsDisplay异步执行的，它会自动调用drawRect方法
        self.setNeedsDisplay()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // MARK: 画图
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // 调用
        self.createCorners()
    }
    
    // Bezier（贝塞尔曲线绘制：角球区域）
    func createCorners() {
        
        let path: UIBezierPath! = UIBezierPath.init()
        // Bezier画圆（弧）
        path.addArc(withCenter: self.centerOfCircle, radius: self.radius, startAngle: self.startAngle, endAngle: self.endAngle, clockwise: true)
        path.lineWidth = self.lineWidth
        path.lineCapStyle = .round
        UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0).setStroke()
        
        // 返回绘制后的图像
        path.stroke()
    }
}
