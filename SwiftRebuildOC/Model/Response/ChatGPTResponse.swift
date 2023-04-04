//
//  ChatGPTResponse.swift
//  SwiftRebuildOC
//
//  Created by 周本健 on 2023/4/5.
//  Copyright © 2023 com.Personal.Benjamin. All rights reserved.
//

import UIKit

struct ChatGPTResponse: Decodable {
    let choices: [Choice]
    
    struct Choice: Decodable {
        let text: String
    }
}
