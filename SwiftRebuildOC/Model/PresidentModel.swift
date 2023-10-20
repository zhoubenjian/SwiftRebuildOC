//
//  PresidentModel.swift
//  SwiftRebuildOC
//
//  Created by 周本健 on 2022/10/15.
//  Copyright © 2022 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import HandyJSON

class PresidentModel: BaseModel {
    
    var data = Array<President>()
    
    required init() {}
}

class President: HandyJSON {
    
    var id: Int?
    var presidentName: String?
    var gender: Int?
    var birthday: Date?
    var birthPlace: String?
    var deathday: Date?
    var isAlive: Int?
    var termOfOffice: String?
    var termStartTime: Date?
    var termEndTime: Date?
    var type: Int?
    var status: Int?
    
    required init() {}
}
