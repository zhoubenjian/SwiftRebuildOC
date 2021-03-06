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

// MARK: - 屏幕宽高
let SCREENWIDTH = UIScreen.main.bounds.width            // 屏幕宽
let SCREENHEIGHT = UIScreen.main.bounds.height        // 屏幕高



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



// MARK: - label相关
func labelProperty(label: UILabel, bgColor: UIColor , bgColorStr: String, textStr: String, textColor: UIColor, textColorStr: String, textFont: CGFloat, textAlignment: NSTextAlignment) {
    if bgColorStr.isEmpty {
        label.backgroundColor = bgColor
    } else {
        label.backgroundColor = colorWithHex(hexColorStr: bgColorStr)
    }
    label.text = textStr
    if textColorStr.isEmpty {
        label.textColor = textColor
    } else {
        label.textColor = colorWithHex(hexColorStr: textColorStr)
    }
    label.font = UIFont.systemFont(ofSize: textFont)
    label.textAlignment = textAlignment
}



// MARK: - button相关
func buttonProperty(btn: UIButton, bgColor: UIColor, bgColorStr: String, titleStr: String, titleFont: CGFloat, titleColorStr: String, titleAlignment: NSTextAlignment) {
    if bgColorStr.isEmpty {
        btn.backgroundColor = bgColor
    } else {
        btn.backgroundColor = colorWithHex(hexColorStr: bgColorStr)
    }
    btn.setTitle(titleStr, for: .normal)
    btn.titleLabel?.font = UIFont.systemFont(ofSize: titleFont)
    btn.setTitleColor(colorWithHex(hexColorStr: titleColorStr), for: .normal)
    btn.titleLabel?.textAlignment = titleAlignment
}



// MARK: - 当前时间
func getCurrentTime() -> String {
    
    // ①获取格林威治时间（GMT）/ 标准时间，比北京时间早了8个小时
    let today = Date()
    
    // ②获取当前时区
    let zone = NSTimeZone.system
    
    // ③获取当前时区和GMT的时间间隔
    let interval = zone.secondsFromGMT()
    
    // ④获取当前系统时间
    let now = today.addingTimeInterval(TimeInterval(interval))
    
    // ⑤Date转String
    let dateformatter = DateFormatter()
    dateformatter.dateFormat = "yyy-MM-dd HH:mm:ss" // 自定义时间格式
    let timeStr = dateformatter.string(from: now)

    return timeStr
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



