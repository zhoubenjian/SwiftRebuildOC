//
//  ALLURL.swift
//  SwiftRebuildOC
//
//  Created by Benjamin on 2022/1/18.
//  Copyright © 2022 com.Personal.Benjamin. All rights reserved.
//

import Foundation

// 测试接口前缀
let TEST_HEAD: String = ""
// 正式（线上）接口前缀
let URL_HEAD: String = ""
// 本地测试环境前缀
let LOCAL_HEAD: String = "http://127.0.0.1:15000"

// 自定义接口前缀
let CENTOS_URL = "http://47.103.140.46:7002"




// 用户协议 & 隐私协议
let USER_PRIVACY_POLICY_URL: String = TEST_HEAD + "/api/ppy/usercenter/system/config"

// 用户卡（本地环境测试:127.0.0.1）
let USER_CARD_LIST_URL: String = LOCAL_HEAD + "/api/cards/myCard"

// 账户明细接口（本地环境测试:127.0.0.1）
let ACCOUNT_DETAIL_LIST_URL: String = LOCAL_HEAD + "/api/user/accountDetail"



// 所有总统
let ALL_PRESIDENTS_LIST_URL = CENTOS_URL + "/president/all"

