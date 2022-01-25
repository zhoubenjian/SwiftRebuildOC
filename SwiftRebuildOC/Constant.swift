//
//  Constant.swift
//  SwiftRebuildOCDemo
//
//  Created by Benjamin on 2020/5/7.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import Foundation
import UIKit
import PKHUD
import SwiftDate

// MARK: - 屏幕宽高
let SCREENWIDTH = UIScreen.main.bounds.width                        // 屏幕宽
let SCREENHEIGHT = UIScreen.main.bounds.height                      // 屏幕高
let TABBARHEIGHT: CGFloat = (SCREENHEIGHT >= 812) ? 83 : 64         // 导航栏高度
let CONTENTVIEWHEIGHT: CGFloat = SCREENHEIGHT - TABBARHEIGHT        // 页面高度
let BOTTOMHEIGHT: CGFloat = (SCREENHEIGHT >= 812) ? 34 : 0          // 刘海屏底部安全高度
// MARK: - Stadio Giuseppe Meazza: 105 x 65
let STADIOGIUSEPPEMEAZZALENGTH: CGFloat = 105
let STADIOGIUSEPPEMEAZZAWIDTH: CGFloat = 65



// MARK: - 颜色相关
func RGB(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
    return UIColor(red: r, green: g, blue: b, alpha: 1.0)
}

func RGBA(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat) -> UIColor {
    return UIColor(red: r, green: g, blue: b, alpha: a)
}

func randomColor() -> UIColor {
    let r = CGFloat(arc4random() % 256) / 255.0
    let g = CGFloat(arc4random() % 256) / 255.0
    let b = CGFloat(arc4random() % 256) / 255.0
    return UIColor(red: r, green: g, blue: b, alpha: 1.0)
}

func colorWithHex(hexColorStr: String) -> UIColor {
    
    if hexColorStr.isEmpty {
        return UIColor.clear
    }
    
    var cString = hexColorStr.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
    
    if cString.count == 0 {
        return UIColor.clear
    }
    
    if cString.hasPrefix("#") {
        cString.remove(at: cString.startIndex)
    }
    
    if cString.count < 6 && cString.count != 6 {
        
        return UIColor.clear
    }
    
    let value = "0x\(cString)"
    
    let scanner = Scanner(string:value)
    
    var hexValue : UInt64 = 0
    // 查找16进制是否存在
    if scanner.scanHexInt64(&hexValue) {
        let redValue = CGFloat((hexValue & 0xFF0000) >> 16) / 255.0
        let greenValue = CGFloat((hexValue & 0xFF00) >> 8) / 255.0
        let blueValue = CGFloat(hexValue & 0xFF) / 255.0
        return UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    } else {
        return UIColor.clear
    }
}



// MARK: - 弹窗显示
func PKHUDShow(str: String) {
    HUD.flash(.label(str), delay: 2)
}

func PKHUDShow(str: String, t: Double) {
    HUD.flash(.label(str), delay: t)
}

func PKHUDShowError(str: String) {
    HUD.show(.label(str))
    HUD.hide(afterDelay: 2)
}



// MARK: - UIView部分圆角
func viewWithPartRound(vi: UIView!, rc1: UIRectCorner!, rc2: UIRectCorner!, cr1: CGFloat, cr2: CGFloat) {
    
//    let maskPath = UIBezierPath.init(roundedRect: vi.bounds, byRoundingCorners: rc1.rawValue & rc2.rawValue, cornerRadii: CGSize(width: cr1, height: cr2))
//    let maskLayer = CAShapeLayer()
//    maskLayer.frame = vi.bounds
//    maskLayer.path = maskPath
}



