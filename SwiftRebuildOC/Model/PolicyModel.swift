//
//  UserPrivacyPolicy.swift
//  SwiftRebuildOC
//
//  Created by Benjamin on 2022/1/18.
//  Copyright © 2022 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import HandyJSON

class PolicyModel: BaseModel {
    
    var customerTime: String?
    var smartgameLink: String?
    var taskView: String?
    var customerQUrl: String?
    var withdrawDefaultSelected: Int?
    var privacyPolicy: String?
    var gameDetailImg: String?
    var withdrawRuleTips: String?
    var customerWX: String?
    var userPolicyUrl: String?
    var customerQQ: String?
    
    required init() {}
}
