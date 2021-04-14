//
//  AntForestView.swift
//  SwiftRebuildOC
//
//  Created by 周本健 on 2021/4/14.
//  Copyright © 2021 com.Personal.Benjamin. All rights reserved.
//

import UIKit

class AntForestView: UIView {
    
    let NUM_OF_ENERGY = 3
    var btnArray: [UIButton]!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 初始化能量数组
        self.btnArray = [UIButton]()
        
        self.createViewUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createViewUI() {
        
        // 创建能量球
        for i in 0..<NUM_OF_ENERGY{
            
            let btn = UIButton()
            buttonProperty(btn: btn, bgColor: .green, bgColorStr: "", titleStr: "", titleFont: 15, titleColorStr: "#0000CD", titleAlignment: .center)
            btn.setTitle("绿色\n能量\(i)", for: .normal)
            btn.titleLabel?.numberOfLines = 0
            btn.layer.cornerRadius = 30;
            btn.layer.masksToBounds = true;
            btnArray.append(btn);
            self.addSubview(btn)
            
            
            
            // 横坐标范围
            let x: Int = Int(arc4random()) % Int(SCREENWIDTH - 60)
            // 纵坐标范围
            let y: Int = Int(arc4random()) % Int(CONTENTVIEWHEIGHT - 60)
            btn.snp.makeConstraints { (make) in
                make.width.height.equalTo(60)
                make.left.equalTo(self).offset(x)
                make.top.equalTo(self).offset(y)
            }
        }
        
        // 能量添加浮动效果
        self.energyMoveTop(energyBtnArray: self.btnArray)
    
    }
    
    
    
    // 能量向上浮动
    func energyMoveTop(energyBtnArray: [UIButton]) {
        
        UIView.animateKeyframes(withDuration: 1, delay: 0.5, options: [.calculationModeLinear, .allowUserInteraction]) {
            
            for i in 0..<energyBtnArray.count {
                
                energyBtnArray[i].frame = CGRect.init(x: energyBtnArray[i].frame.origin.x, y: energyBtnArray[i].frame.origin.y - 5, width: 60, height: 60)
            }
            
        } completion: { (Bool) in
            
            self.energyMoveBottom(energyBtnArray: energyBtnArray)
            
        }

    }
    
    // 能量向下浮动
    func energyMoveBottom(energyBtnArray: [UIButton]) {
        
        UIView.animateKeyframes(withDuration: 1, delay: 0.5, options: [.calculationModeLinear, .allowUserInteraction]) {
            
            for i in 0..<energyBtnArray.count {
                
                energyBtnArray[i].frame = CGRect.init(x: energyBtnArray[i].frame.origin.x, y: energyBtnArray[i].frame.origin.y + 5, width: 60, height: 60)
            }
            
        } completion: { (Bool) in
            
            self.energyMoveTop(energyBtnArray: energyBtnArray)
            
        }
    }
}
