//
//  AccountDetailModel.swift
//  SwiftRebuildOC
//
//  Created by Benjamin on 2022/1/20.
//  Copyright © 2022 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import HandyJSON

class AccountDetailModel: HandyJSON {
    
    var code: Int?
    var status: Int?
    var message: String?
    var view: String?
    var timestamp: Int64?
    
    var list = Array<UserBalanceRecord>()

    required init() {}
}

class UserBalanceRecord: HandyJSON {
    
    var type: Int?
    var remark: String?
    var money: Double?
    var time: Date?
    var notice: Int?
    
    required init() {}
}
