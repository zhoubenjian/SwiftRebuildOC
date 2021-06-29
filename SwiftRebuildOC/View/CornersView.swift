//
//  CornersView.swift
//  SwiftRebuildOC
//
//  Created by 周本健 on 2021/6/29.
//  Copyright © 2021 com.Personal.Benjamin. All rights reserved.
//

import UIKit

class CornersView: UIView {
    
    var path: UIBezierPath!

    init(frame: CGRect, lineWidth: CGFloat, lineColor: UIColor) {
        super.init(frame: frame)
        
        self.setNeedsDisplay()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func draw(_ rect: CGRect) {
        self.createCorners()
        //(coc: CGPoint(200, 200), r: 50, sa: 0, ea: -1/2 * M_PI)
    }
    
    // 画角球点
    func createCorners() {
        
        self.path = UIBezierPath.init();
        self.path.addArc(withCenter: CGPoint(x: 200, y: 200), radius: 50, startAngle: 0, endAngle: CGFloat(-1/2 * M_PI), clockwise: true)
        self.path.lineWidth = 1.5
        self.path.lineCapStyle = .round
        colorWithHex(hexColorStr: "#FF7C08").setStroke()
    }
}
