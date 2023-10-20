//
//  Messages.swift
//  SwiftRebuildOC
//
//  Created by 周本健 on 2023/3/31.
//  Copyright © 2023 com.Personal.Benjamin. All rights reserved.
//

import UIKit

class Messages: NSObject {
    
    var role: String?
    var content: String?
    
    required init(role: String, content: String) {
        self.role = role
        self.content = content;
    }
}
