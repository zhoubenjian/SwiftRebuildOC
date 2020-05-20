//
//  HomeVC.swift
//  SwiftRebuildOCDemo
//
//  Created by 周本健 on 2020/5/7.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import SnapKit

class HomeVC: BaseVC {
    
    var mainView: HomeView!
    var styleArray: [String]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "首页"
        self.view.backgroundColor = .white
    
        self.styleArray = ["value1", "value2", "subtitle", "default", "adaptiveTableView", "commonCollectionView", "waterCollectionView", "complexVC", "groupVC", "sectionVC"]
        self.createUI()
    }
    
    func createUI() {
        
        self.mainView = HomeView()
        self.mainView.loadData(dataArray: self.styleArray)
        self.view.addSubview(self.mainView)
        self.mainView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.mainView.skipToTVClosures = {(str) in
            
            let dVC: DefaultVC = DefaultVC()
            dVC.str = str
            self.navigationController?.pushViewController(dVC, animated: true)
            
        }
        
        self.mainView.skipToCVClosures = {(str) in
            
            if (str as NSString).isEqual(to: "commonCollectionView") {
                
                let ccVC: CommonCollectionVC = CommonCollectionVC()
                self.navigationController?.pushViewController(ccVC, animated: true)
                
            } else if (str as NSString).isEqual(to: "waterCollectionView") {
                
                let wcVC: WaterCollectionVC = WaterCollectionVC()
                self.navigationController?.pushViewController(wcVC, animated: true)
                
            }
            
        }
        
        self.mainView.skipToCXClosures = {
            
            let cpVC: ComplexVC = ComplexVC()
            self.navigationController?.pushViewController(cpVC, animated: true)
            
        }
        
        self.mainView.skipToGVClosures = {
            
            let gVC: GroupVC = GroupVC()
            self.navigationController?.pushViewController(gVC, animated: true)
            
        }
        
        self.mainView.skipToSVClosures = {
            
            let sVC: SectionVC = SectionVC()
            self.navigationController?.pushViewController(sVC, animated: true)
            
        }
    }
}
