//
//  ButtonTool.swift
//  SwiftRebuildOC
//
//  Created by Benjamin on 2022/1/25.
//  Copyright © 2022 com.Personal.Benjamin. All rights reserved.
//

import Foundation
import UIKit



// MARK: - UIButton相关
func buttonProperty(btn: UIButton!, bgColor: UIColor?, bgColorStr: String!, titleStr: String!, titleFont: CGFloat!, titleColor: UIColor?, titleColorStr: String!, titleAlignment: NSTextAlignment!) {
    
    if let color = bgColor {
        btn.backgroundColor = color
    } else {
        btn.backgroundColor = colorWithHex(hexColorStr: bgColorStr)
    }
    
    btn.setTitle(titleStr, for: .normal)
    btn.titleLabel?.font = UIFont.systemFont(ofSize: titleFont)
    
    if let color = titleColor {
        btn.setTitleColor(color, for: .normal)
    } else {
        btn.setTitleColor(colorWithHex(hexColorStr: titleColorStr), for: .normal)
    }
    
    btn.titleLabel?.textAlignment = titleAlignment
}

// MARK: - UIButton全圆角
func buttonWithAllRound(btn: UIButton!, radius: CGFloat!) {
    
    btn.layer.masksToBounds = true
    btn.layer.cornerRadius = radius
}
