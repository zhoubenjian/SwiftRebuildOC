//
//  AlamofireVC.swift
//  SwiftRebuildOC
//
//  Created by Benjamin on 2022/1/18.
//  Copyright © 2022 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import HandyJSON

class AlamofireVC: BaseVC {
    
    var mainView: AlamofireView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createUI()
    }
    
    func loadDataWithUserCard(list: [InfoModel]) {
        
        if list.count > 0 {
            
            for i in 0..<list.count {
                
                print("\(String(describing: list[i].cardId))")
                print("\(String(describing: list[i].userCardId))")
                print("\(String(describing: list[i].maxMoney))")
                print("\(String(describing: list[i].title))")
                print("\(String(describing: list[i].desc))")
                print("\(String(describing: list[i].note))")
                print("\(String(describing: list[i].status))")
                print("\(String(describing: list[i].canActive))")
                print("\(String(describing: list[i].availableDay))")
                print("\n***************************\n")
                
            }
            
        } else {
            
            print("你还没有用户卡")
        }
    }
    
    func createUI() {
        
        self.mainView = AlamofireView()
        self.view.addSubview(self.mainView)
        
        
        
        self.mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
        
        self.mainView.netWorkingClosure = {
            
            //            NetWorkingAPIManager.netWorkingAPIManager.UserPrivacyPolicy { responseType, policy in
            //
            //                if responseType {
            //
            //                    print("\(policy)")
            //                }
            //            }
            
            
            
            //            NetWorkingAPIManager.netWorkingAPIManager.LocalUserCards(userId: 70, keycode: "qwer", phoneType: 2, sdkInt: 27) { responseType, userInfoModel in
            //
            //                if responseType {
            //
            //                    self.loadDataWithUserCard(list: userInfoModel.data)
            //
            //                }
            //            }
            
            
            
            NetWorkingAPIManager.netWorkingAPIManager.AccountDetail(userId: 70, keycode: "qwer", phoneType: 2, sdkInt: 27, type: 0, page: 1, pageSize: 20) { responseType, accountDetailModel in
                
                if responseType {
                    
                    
                }
            }
        }
    }
}
