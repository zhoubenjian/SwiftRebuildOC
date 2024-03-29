//
//  HomeVC.swift
//  SwiftRebuildOCDemo
//
//  Created by Benjamin on 2020/5/7.
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
        
        self.styleArray = ["Value1", "Value2", "Subtitle", "Default", "AdaptiveTableView", "CommonCollectionView", "WaterCollectionView", "ComplexVC", "GroupVC", "SwipeDeleteVC", "SectionVC", "GalleryVC", "SimpleCalculatorVC", "WKWebView", "ChartsVC", "AntForestVC", "FootballFieldTableVC", "PagesVC", "PageRequsetVC", "ChatGPTVC"]
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
            
            if "CommonCollectionView".isEqual(str) {
                
                let ccVC: CommonCollectionVC = CommonCollectionVC()
                self.navigationController?.pushViewController(ccVC, animated: true)
                
            } else if "WaterCollectionView".isEqual(str) {
                
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
        
        self.mainView.skipToSDClosures = {
            
            let sdVC: SwipeDeleteVC = SwipeDeleteVC()
            self.navigationController?.pushViewController(sdVC, animated: true)
            
        }
        
        self.mainView.skipToSVClosures = {
            
            let sVC: SectionVC = SectionVC()
            self.navigationController?.pushViewController(sVC, animated: true)
            
        }
        
        self.mainView.skipToGalleryVClosures = {
            
            let gVC: GalleryVC = GalleryVC()
            self.navigationController?.pushViewController(gVC, animated: true)
            
        }
        
        self.mainView.skipToSCVClosures = {
            
            let scVC: SimpleCalculatorVC = SimpleCalculatorVC()
            self.navigationController?.pushViewController(scVC, animated: true)
            
        }
        
        self.mainView.skipToWVVCClosures = {
            
            let wkVC: WKWebViewVC = WKWebViewVC()
            self.navigationController?.pushViewController(wkVC, animated: true)
            
        }
        
        self.mainView.skipToChartsVCClosures = {
            
            let cVC: ChartsVC = ChartsVC()
            self.navigationController?.pushViewController(cVC, animated: true)
            
        }
        
        self.mainView.skipToAntForestVCClosures = {
            
            let aVC: AntForestVC = AntForestVC()
            self.navigationController?.pushViewController(aVC, animated: true)
            
        }
        
        self.mainView.skipToFootballFieldVCClosures = {
            
            let fVC: FootballFieldVC = FootballFieldVC()
            self.navigationController?.pushViewController(fVC, animated: true)
        }
        
        self.mainView.skipToPagesVCClosures = {
            
            let pVC: PagesVC = PagesVC()
            self.navigationController?.pushViewController(pVC, animated: true)
        }
        
        self.mainView.skipToPageRequsetVCClosures = {
            
            let prVC: PageRequsetVC = PageRequsetVC()
            self.navigationController?.pushViewController(prVC, animated: true)
        }
        
        self.mainView.skipToChatGPTVCClosures = {
            
            let cgVC: ChatGPTVC = ChatGPTVC()
            self.navigationController?.pushViewController(cgVC, animated: true)
        }
    }
}
