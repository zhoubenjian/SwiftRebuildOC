//
//  BaseModel.swift
//  SwiftRebuildOC
//
//  Created by Benjamin on 2022/1/18.
//  Copyright © 2022 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import HandyJSON

class BaseModel: HandyJSON {
    
    var code: Int?
    var status: Int?
    var message: String?
    var view: String?
    var timestamp: Int64?

    required init() {}
}

