//
//  BaseAPI.swift
//  SwiftRebuildOC
//
//  Created by Benjamin on 2022/1/18.
//  Copyright © 2022 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

// 网络请求类型
enum RequestType {
    
    case RequestTypeGET
    
    case RequestTypePOST
}

// 网络请求结果类型
enum RequestResultType {
    
    case RequestResultTypeNetWorkStatusNone         // 无网络
    
    case RequestResultTypeNoData                    // 无数据
    
    case RequestResultTypeError                     // 请求错误
    
    case RequestResultTypeSuccess                   // 请求成功
}



//typealias RequestResultClosures = (AFDataResponse<String>) -> Void


class BaseAPI: NSObject {
    
    func GETRequestWithURL(url: String) {
        
    }
}
