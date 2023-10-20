//
//  CardInfoModel.swift
//  SwiftRebuildOC
//
//  Created by Benjamin on 2022/1/19.
//  Copyright © 2022 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import HandyJSON

class CardInfoModel: BaseModel {

//    var code: Int?
//    var status: Int?
//    var message: String?
//    var view: String?
//    var timestamp: Int64?
    
    var data = Array<InfoModel>()
    
    required init() {}
}

class InfoModel: HandyJSON {
    
    var cardId: Int64?
    var userCardId: Int64?
    var maxMoney: Double?
    var title: String?
    var desc: String?
    var note: String?
    var status: Int?
    var expiredTime: Int64?
    var canActive: Bool?
    var availableDay: Int64?
    var config: String?
    
    required init() {}
}
