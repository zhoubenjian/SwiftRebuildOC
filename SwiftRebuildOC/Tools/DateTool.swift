//
//  DateTool.swift
//  SwiftRebuildOC
//
//  Created by Benjamin on 2022/1/25.
//  Copyright © 2022 com.Personal.Benjamin. All rights reserved.
//

import Foundation
import SwiftDate


enum DateFormatterEnum: String {
    
    case YYYY_MM_DD = "yyyy-MM-dd"
    case YYYY年MM月DD日 = "yyyy年MM月dd日"
    
    case YYYY_MM_DD_HH_mm_ss = "yyyy-MM-dd HH:mm:ss"
    case YYYY年MM月DD人HH时mm分ss秒 = "yyyy年MM月dd日 HH时mm分ss秒"
}



// MARK: - 当前时间
func currentTime(dateFormat: String) -> String {
    
    let date = Date()
    
    let dateformatter = DateFormatter()
    // 自定义时间格式
    dateformatter.dateFormat = dateFormat
    let timeStr = dateformatter.string(from: date)

    return timeStr
}

// MARK: - 秒 转 小时，分钟
func secondToHourMinute(second: Int64) -> String {
    
    let h = second / 3600       // 时
    let m = second % 3600 / 60  // 分
    
    return String(format: "%02d:%02d", h, m)
}

// MARK: - ISO8601 -> 时间格式
func ISO801ToString(ISO8601: String, dateFormat: String) -> String {
    
    if let ISODate = ISO8601.toISODate() {
        
        let dateformatter = DateFormatter()
        // 自定义时间格式
        dateformatter.dateFormat = dateFormat
        let timeStr = dateformatter.string(from: ISODate.date)
        return timeStr
    }

    return "0000-00-00"
}

