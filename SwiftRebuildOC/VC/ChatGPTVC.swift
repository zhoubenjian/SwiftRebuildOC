//
//  ChatGPTVC.swift
//  SwiftRebuildOC
//
//  Created by Benjamin on 2023/3/28.
//  Copyright © 2023 com.Personal.Benjamin. All rights reserved.
//

import UIKit

class ChatGPTVC: BaseVC {
    
    var mainView: ChatGPTView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "ChatGPTVC"
        self.view.backgroundColor = .white
        
        self.createUI()
        self.initNetWork()
    }
    
    func createUI() {
        self.mainView = ChatGPTView()
        self.view.addSubview(self.mainView)
        
        self.mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // 网络请求
    func initNetWork() {
        ChatGPTClient().ChatGPT(prompt: "Hello!") { response in
            print(response)
        }
    }
}
