//
//  DefaultVC.swift
//  SwiftRebuildOCDemo
//
//  Created by Benjamin on 2020/5/8.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit

class DefaultVC: BaseVC {
    
    var mainView: DefaultView!
    var str: String!
    var poemArray: [String]!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = str
        self.view.backgroundColor = .white
        
        poemArray = ["《静夜思》\n窗前明月光，\n疑是地上霜。\n举头望明月，\n低头思故乡。",
                     "《赠汪伦》\n李白乘舟将欲行，\n忽闻岸上踏歌声。\n桃花潭水深千尺，\n不及汪伦送我情。",
                     "《关山月》\n明月出天山，苍茫云海间。\n长风几万里，吹度玉门关。\n汉下白登道，胡窥青海湾。\n由来征战地，不见有人还。\n戍客望边色，思归多苦颜。\n高楼当此夜，叹息未应闲。",
                     "《早发白帝城》\n朝辞白帝彩云间，\n千里江陵一日还。\n两岸猿声啼不住，\n轻舟已过万重山。",
                     "《望天门山》\n天门中断楚江开，\n碧水东流至此回。\n两岸青山相对出，\n孤帆一片日边来。"]
        self.createUI()
    }
    
    func createUI() {
        
        self.mainView = DefaultView()
        self.mainView.loadData(str: self.str)
        self.mainView.loadData(poemArray: self.poemArray)
        self.view.addSubview(self.mainView)
        self.mainView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

}
