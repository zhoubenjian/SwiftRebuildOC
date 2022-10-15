//
//  NetWorkingAPI.swift
//  SwiftRebuildOC
//
//  Created by Benjamin on 2022/1/18.
//  Copyright © 2022 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import HandyJSON

typealias ResponseResultClosures = (AFDataResponse<String>) -> Void

class NetWorkingAPI: NSObject {
    
    // 用户协议 & 隐私协议
    func UserPrivacyPolicy(resultClosures: @escaping ResponseResultClosures) {
        
//        let headParams: HTTPHeaders = ["Content-Type": "application/x-www-form-urlencoded;charset=UTF-8", "Accept": "application/json"]
        
        AF.request(USER_PRIVACY_POLICY_URL, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).validate().responseString { response in
            
            resultClosures(response)
        }
    }
        
    // 用户卡
    func LocalUserCards(userId: Int64, keycode: String, phoneType: Int, sdkInt: Int, resultClosures: @escaping ResponseResultClosures) {
            
        let params: Dictionary<String, Any> = ["userId": userId, "keycode": keycode, "phoneType": phoneType, "sdkInt": sdkInt]
        let headParams: HTTPHeaders = ["Content-Type": "application/x-www-form-urlencoded;charset=UTF-8", "Accept": "application/json"]
        
        AF.request(USER_CARD_LIST_URL, method: .get, parameters: params, encoding: URLEncoding.default, headers: headParams).validate().responseString { response in
            
            resultClosures(response)
        }
    }
    
    // 账户明细接口（分页）
    func AccountDetail(userId: Int64, keycode: String, phoneType: Int, sdkInt: Int, type: Int, page: Int, pageSize: Int, resultClosures: @escaping ResponseResultClosures) {
        
        let params: Dictionary<String, Any> = ["userId": userId, "keycode": keycode, "phoneType": phoneType, "sdkInt": sdkInt, "type": type, "page": page, "pageSize": pageSize]
        
        AF.request(ACCOUNT_DETAIL_LIST_URL, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil, interceptor: nil).validate().responseString { response in
            
            resultClosures(response)
        }
    }
    
    
    
    // 所有总统
    func AllPresident(resultClosures: @escaping ResponseResultClosures) {
        
        AF.request(ALL_PRESIDENTS_LIST_URL, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).validate().responseString {
            response in
            
            resultClosures(response);
        }
    }
}
