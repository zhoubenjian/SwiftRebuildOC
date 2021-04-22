//
//  AntForestView.swift
//  SwiftRebuildOC
//
//  Created by Benjamin on 2021/4/14.
//  Copyright © 2021 com.Personal.Benjamin. All rights reserved.
//

import UIKit

class AntForestView: UIView {
    
    let NUM_OF_ENERGY = 3
    var totaLEnergyLabel: UILabel!
    var btnArray: [UIButton]!
    var totalEnergy = 0
    
    
    typealias CountTimeClosures = (DispatchSourceTimer) -> ()
    var countTimeClosures: CountTimeClosures!
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.createViewUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createViewUI() {
        
        // 初始化能量球数组
        self.btnArray = [UIButton]()
        
        // 创建能量球
        for i in 0..<NUM_OF_ENERGY{
            
            self.totaLEnergyLabel = UILabel()
            self.totaLEnergyLabel.layer.masksToBounds = true
            self.totaLEnergyLabel.layer.cornerRadius = 20
            labelProperty(label: self.totaLEnergyLabel, bgColor: .white, bgColorStr: "", textStr: "0g", textColor: .green, textColorStr: "", textFont: 15.0, textAlignment: .center)
            self.addSubview(self.totaLEnergyLabel)
            
            let btn = UIButton()
            // 添加收取能量方法
            btn.addTarget(self, action: #selector(gain), for: .touchUpInside)
            buttonProperty(btn: btn, bgColor: .green, bgColorStr: "", titleStr: "", titleFont: 15, titleColorStr: "#0000CD", titleAlignment: .center)
            btn.alpha = 0.5
            btn.isEnabled = false   // 不可点击
            btn.setTitle("绿色\n能量\(i)", for: .normal)
            btn.titleLabel?.numberOfLines = 0
            btn.layer.cornerRadius = 30
            btn.layer.masksToBounds = true
            btnArray.append(btn)
            self.addSubview(btn)
            
            
            
            totaLEnergyLabel.snp.makeConstraints { (make) in
                make.width.equalTo(150)
                make.height.equalTo(40)
                make.right.equalToSuperview()
                make.top.equalToSuperview().offset(30)
            }
            
            // 横坐标范围
            let x: Int = Int(arc4random()) % Int(SCREENWIDTH - 60)
            // 纵坐标范围
            let y: Int = Int(arc4random()) % Int(CONTENTVIEWHEIGHT - 60 - 600) + 70
            btn.snp.makeConstraints { (make) in
                make.width.height.equalTo(60)
                make.left.equalTo(self).offset(x)
                make.top.equalTo(self).offset(y)
            }
            
            if (i == NUM_OF_ENERGY - 3) {
                
                // GCD倒计时（成熟时间）
                self.countDown(timeInterval: 59, index: i, energyValue: 100)
                
            } else if (i == (NUM_OF_ENERGY - 2)) {
                
                // GCD倒计时（成熟时间）
                self.countDown(timeInterval: 80, index: i, energyValue: 100)
                
            } else if (i == (NUM_OF_ENERGY - 1)) {
                
                // GCD倒计时（成熟时间）
                self.countDown(timeInterval: 121, index: i, energyValue: 100)
                
            }
            
        }
        
        // 能量球添加浮动效果
        self.energyMoveTop(energyBtnArray: self.btnArray)
    
    }
    
    
    
    // 能量球向上浮动
    func energyMoveTop(energyBtnArray: [UIButton]) {
        
        UIView.animateKeyframes(withDuration: 1, delay: 0.5, options: [.calculationModeLinear, .allowUserInteraction]) {
            
            for i in 0..<energyBtnArray.count {
                
                energyBtnArray[i].frame = CGRect.init(x: energyBtnArray[i].frame.origin.x, y: energyBtnArray[i].frame.origin.y - 5, width: 60, height: 60)
            }
            
        } completion: { (Bool) in
            
            self.energyMoveBottom(energyBtnArray: energyBtnArray)
            
        }

    }
    
    // 能量球向下浮动
    func energyMoveBottom(energyBtnArray: [UIButton]) {
        
        UIView.animateKeyframes(withDuration: 1, delay: 0.5, options: [.calculationModeLinear, .allowUserInteraction]) {
            
            for i in 0..<energyBtnArray.count {
                
                energyBtnArray[i].frame = CGRect.init(x: energyBtnArray[i].frame.origin.x, y: energyBtnArray[i].frame.origin.y + 5, width: 60, height: 60)
            }
            
        } completion: { (Bool) in
            
            self.energyMoveTop(energyBtnArray: energyBtnArray)
            
        }
    }
    
    // GCD倒计时
    func countDown(timeInterval: Double, index: Int, energyValue: Int) {
        
        var time = timeInterval + 60.0      // 多加1分钟（60s）
        let codeTimer = DispatchSource.makeTimerSource(flags: .init(rawValue: 0), queue: .global())
        codeTimer.schedule(deadline: .now(), repeating: .milliseconds(1000 * 60))   // 每1分钟更新一次数据
        codeTimer.setEventHandler {
            
            time = time - 1.0 * 60
            
            if time < 60 {
                
                // 关闭倒计时
                codeTimer.cancel()
                
                /*** 主线程操作视图UI ***/
                DispatchQueue.main.async {
                    
                    // 修改能量球状态
                    self.btnArray[index].isEnabled = true
                    self.btnArray[index].alpha = 1.0
                    
                    buttonProperty(btn: self.btnArray[index], bgColor: .green, bgColorStr: "", titleStr: String(format: "%d克", energyValue), titleFont: 15.0, titleColorStr: "#0000CD", titleAlignment: .center)
                    
                }
                
                return
                
            } else {
                                
                /*** 主线程操作视图UI ***/
                DispatchQueue.main.async {
                    
                    // 更改能量球倒计时
                    buttonProperty(btn: self.btnArray[index], bgColor: .green, bgColorStr: "", titleStr: String(format: "还剩\n%@", secondToHourMinute(second: Int64(time))), titleFont: 15.0, titleColorStr: "#0000CD", titleAlignment: .center)
                    
                }
                
            }
    
        }
        
        // 开启计时器
        codeTimer.activate()
        
    }
    
    
    
    // 收取能量球
    @objc func gain(btn: UIButton) {
        
        // 移除能量球
        btn.removeFromSuperview()
        
        // 累加能量
        self.totalEnergy += 100
        labelProperty(label: self.totaLEnergyLabel, bgColor: .white, bgColorStr: "", textStr: String(format: "%dg", self.totalEnergy), textColor: .green, textColorStr: "", textFont: 15.0, textAlignment: .center)
        
    }
}
