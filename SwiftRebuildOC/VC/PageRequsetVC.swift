//
//  PageRequsetVC.swift
//  SwiftRebuildOC
//
//  Created by Benjamin on 2022/1/20.
//  Copyright © 2022 com.Personal.Benjamin. All rights reserved.
//

import UIKit

class PageRequsetVC: BaseVC {
    
    var mainView: PageRequsetView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "PageRequsetVC"
        self.view.backgroundColor = .white
        
        self.createUI()
        
        self.initNetWork()
    }
    
    func createUI() {
        
        self.mainView = PageRequsetView()
        self.view.addSubview(self.mainView);
        
        
        
        self.mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
    
    func initNetWork() {
        
        NetWorkingAPIManager.netWorkingAPIManager.AccountDetail(userId: 70, keycode: "qwer", phoneType: 2, sdkInt: 27, type: 0, page: 1, pageSize: 20) { responseType, accountDetailModel in
            
            if responseType {
                
                if accountDetailModel.list.count > 0 {
                    
                    self.mainView.loadData(list: accountDetailModel.list)
                    
                } else {
                    
                    PKHUDShow(str: "暂无数据")
                }
            }
        }
    }
}
