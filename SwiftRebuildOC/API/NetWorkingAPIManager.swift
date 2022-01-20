//
//  NetWorkingAPIManager.swift
//  SwiftRebuildOC
//
//  Created by Benjamin on 2022/1/19.
//  Copyright © 2022 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import HandyJSON

typealias ConfigResultClousures = (Bool, PolicyModel) -> Void
typealias UserCardResultClosures = (Bool, CardInfoModel) -> Void
typealias AccountDetailResultClosures = (Bool, AccountDetailModel) -> Void

class NetWorkingAPIManager: NSObject {
    
    var netWorkingAPI: NetWorkingAPI!    
    static let netWorkingAPIManager = NetWorkingAPIManager()
    
    private override init() {
        super.init()
    }
    
    func createAPI() -> NetWorkingAPI {
        if self.netWorkingAPI == nil {
            self.netWorkingAPI = NetWorkingAPI();
        }
        return self.netWorkingAPI
    }
    
    // 用户协议 & 隐私协议
    func UserPrivacyPolicy(resultClosures: @escaping ConfigResultClousures) {
        
        self.createAPI().UserPrivacyPolicy { response in
            
            switch response.result {
                
            case .success(let json):
                
                // UTF-8编码
                let JsonString = json.cString(using: String.Encoding.isoLatin1)!
                let utf8JsonString = String(cString: JsonString, encoding: String.Encoding.utf8)
                if let baseModel = JSONDeserializer<BaseModel>.deserializeFrom(json: utf8JsonString) {
                    
                    // 请求成功
                    if baseModel.status == 0 {
                        
                        if let policyModel = JSONDeserializer<PolicyModel>.deserializeFrom(json: utf8JsonString, designatedPath: "data") {

                            resultClosures(true, policyModel)
                        }
                        
                    } else {
                        
                        PKHUDShow(str: "\(baseModel.view ?? "")")
                    }
                    
                } else {
                    
                    PKHUDShow(str: "类型错误")
                }
                break;
                
            case .failure(let error):
                print("\(error)")
                PKHUDShow(str: "\(error)")
                break;
            }
        }
    }
    
    // 用户卡
    func LocalUserCards(userId: Int64, keycode: String, phoneType: Int, sdkInt: Int, resultClosures: @escaping UserCardResultClosures) {
        
        self.createAPI().LocalUserCards(userId: userId, keycode: keycode, phoneType: phoneType, sdkInt: sdkInt) { response in
            
            switch response.result {
                
            case .success(let json):
                
                // UTF-8编码
                let JsonString = json.cString(using: String.Encoding.isoLatin1)!
                let utf8JsonString = String(cString: JsonString, encoding: String.Encoding.utf8)
                
                if let responseObject = JSONDeserializer<CardInfoModel>.deserializeFrom(json: utf8JsonString) {
                    
                    // status = 0：请求成功
                    if responseObject.status == 0 {
                        
                        resultClosures(true, responseObject)
                        
                    } else {
                        
                        print("\(responseObject.view ?? "")")
                        PKHUDShow(str: "\(responseObject.view ?? "")")
                    }
                    
                } else {
                    
                    PKHUDShow(str: "类型转换异常")
                }
                break;
                
            case .failure(let error):
                print("\(error)")
                PKHUDShow(str: "\(error)")
                break;
            }
        }
    }
    
    // 账户明细接口
    func AccountDetail(userId: Int64, keycode: String, phoneType: Int, sdkInt: Int, type: Int, page: Int, pageSize: Int, resultClosures: @escaping AccountDetailResultClosures) {
        
        self.createAPI().AccountDetail(userId: userId, keycode: keycode, phoneType: phoneType, sdkInt: sdkInt, type: type, page: page, pageSize: pageSize) { response in
            
            switch response.result {
                
            case .success(let json):
                
                // UTF-8编码
                let JsonString = json.cString(using: String.Encoding.isoLatin1)!
                let utf8JsonString = String(cString: JsonString, encoding: String.Encoding.utf8)
                
                if let responseObject = JSONDeserializer<AccountDetailModel>.deserializeFrom(json: utf8JsonString, designatedPath: nil) {
                    
                    if responseObject.status == 0 {
                        
                        resultClosures(true, responseObject)
                        
                    } else {
                        
                        print("\(responseObject.view ?? "")")
                        PKHUDShow(str: "\(responseObject.view ?? "")")
                    }
                    
                } else {
                    
                    PKHUDShow(str: "类型转换异常")
                }
                break
                
            case .failure(let error):
                
                print("\(error)")
                PKHUDShow(str: "网络异常...")
                break
            }
        }
    }
}
