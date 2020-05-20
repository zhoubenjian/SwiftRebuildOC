//
//  GroupVC.swift
//  SwiftRebuildOC
//
//  Created by 周本健 on 2020/5/15.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import SnapKit

class GroupVC: BaseVC {
    
    var mainView: GroupView!
    
    var titleArray: [String]!
    var dataDic: Dictionary<Int, [String]>!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "GroupVC"
        self.view.backgroundColor = .white
        
        self.titleArray = [ "一线城市", "新一线城市", "二线城市"];
        self.dataDic = [
            0: [
                "北京市", "上海市", "广州市", "深圳市",
            ],
            1: [
                "成都市", "杭州市", "重庆市", "武汉市",
                "西安市", "苏州市", "天津市", "南京市",
                "长沙市", "郑州市", "东莞市", "青岛市",
                "沈阳市", "宁波市", "昆明市",
            ],
            2: [
                "无锡市", "佛山市", "合肥市", "大连市",
                "福州市", "厦门市", "哈尔滨市", "济南市",
                "温州市", "南宁市", "长春市", "泉州市",
                "石家庄市", "贵阳市", "南昌市", "金华市",
                "常州市", "南通市", "嘉兴市", "太原市",
                "徐州市", "惠州市", "珠海市", "中山市",
                "台州市", "烟台市", "兰州市", "绍兴市",
                "海口市", "扬州市"
            ]
        ];
        self.createUI()
    }
    
    func createUI() {
        
        self.mainView = GroupView()
        self.mainView.loadData(titleArray: self.titleArray, dataDic: self.dataDic)
        self.view.addSubview(self.mainView)
        self.mainView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

}
