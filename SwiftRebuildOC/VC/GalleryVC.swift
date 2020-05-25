//
//  GalleryVC.swift
//  SwiftRebuildOC
//
//  Created by 周本健 on 2020/5/25.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import SnapKit

class GalleryVC: BaseVC {
    
    var mainView: GalleryView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Gallery"
        self.view.backgroundColor = .white
        self.createUI()
    }
    
    func createUI() {
        
        self.mainView = GalleryView()
        self.view.addSubview(self.mainView)
        
        
        
        self.mainView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

}
