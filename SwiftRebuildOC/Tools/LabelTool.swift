//
//  LabelTool.swift
//  SwiftRebuildOC
//
//  Created by Benjamin on 2022/1/25.
//  Copyright © 2022 com.Personal.Benjamin. All rights reserved.
//

import Foundation
import UIKit



// MARK: - UILabel相关
func labelProperty(label: UILabel!, bgColor: UIColor?, bgColorStr: String!, textStr: String!, textColor: UIColor?, textColorStr: String!, textFont: CGFloat!, textAlignment: NSTextAlignment!) {
    
    if let color = bgColor {
        label.backgroundColor = color
    } else {
        label.backgroundColor = colorWithHex(hexColorStr: bgColorStr)
    }
    
    label.text = textStr
    
    if let color = textColor {
        label.textColor = color
    } else {
        label.textColor = colorWithHex(hexColorStr: textColorStr)
    }
    
    label.font = UIFont.systemFont(ofSize: textFont)
    label.textAlignment = textAlignment
}

// MARK: - UILabel全圆角
func labelWithAllRound(label: UILabel!, radius: CGFloat!) {
    
    label.layer.masksToBounds = true
    label.layer.cornerRadius = radius
}

