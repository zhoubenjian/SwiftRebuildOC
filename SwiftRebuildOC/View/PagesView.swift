//
//  PagesView.swift
//  SwiftRebuildOC
//
//  Created by Benjamin on 2022/1/25.
//  Copyright © 2022 com.Personal.Benjamin. All rights reserved.
//

import UIKit

class PagesView: UIView {
    
    var topView: UIView!
    var leftLabel: UILabel!
    var middleLabel: UILabel!
    var rightLabel: UILabel!
    var underLineView: UIView!
    var scrollView: UIScrollView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.createViewUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func createViewUI() {
        
        self.topView = UIView.init(frame: CGRect(x: 0, y: 0, width: SCREENWIDTH, height: 48))
        self.topView.backgroundColor = .white
        self.addSubview(self.topView)
        
        self.leftLabel = UILabel.init(frame: CGRect(x: 0, y: 0, width: SCREENWIDTH / 3, height: 45))
        labelProperty(label: self.leftLabel, bgColor: .clear, bgColorStr: "", textStr: "魏", textColor: .orange, textColorStr: "", textFont: 15.0, textAlignment: .center)
        // 允许穿透
        self.leftLabel.isUserInteractionEnabled = true
        /** 创建手势对象 **/
        let leftTap = UITapGestureRecognizer.init(target: self, action: #selector(LeftTap))
        leftTap.numberOfTapsRequired = 1
        leftTap.numberOfTouchesRequired = 1
        self.leftLabel.addGestureRecognizer(leftTap)
        /** 创建手势对象 **/
        self.topView.addSubview(self.leftLabel)
        
        self.middleLabel = UILabel.init(frame: CGRect(x: SCREENWIDTH / 3, y: 0, width: SCREENWIDTH / 3, height: 45))
        labelProperty(label: self.middleLabel, bgColor: .clear, bgColorStr: "", textStr: "蜀", textColor: nil, textColorStr: "#333333", textFont: 15.0, textAlignment: .center)
        // 允许穿透
        self.middleLabel.isUserInteractionEnabled = true
        /** 创建手势对象 **/
        let middleTap = UITapGestureRecognizer.init(target: self, action: #selector(MiddleTap))
        middleTap.numberOfTapsRequired = 1
        middleTap.numberOfTouchesRequired = 1
        self.middleLabel.addGestureRecognizer(middleTap)
        /** 创建手势对象 **/
        self.topView.addSubview(self.middleLabel)
        
        self.rightLabel = UILabel.init(frame: CGRect(x: SCREENWIDTH / 3 * 2, y: 0, width: SCREENWIDTH / 3, height: 45))
        labelProperty(label: self.rightLabel, bgColor: .clear, bgColorStr: "", textStr: "吴", textColor: nil, textColorStr: "#333333", textFont: 15.0, textAlignment: .center)
        // 允许穿透
        self.rightLabel.isUserInteractionEnabled = true
        /** 创建手势对象 **/
        let rightTap = UITapGestureRecognizer.init(target: self, action: #selector(RightTap))
        rightTap.numberOfTapsRequired = 1
        rightTap.numberOfTouchesRequired = 1
        self.rightLabel.addGestureRecognizer(rightTap)
        /** 创建手势对象 **/
        self.topView.addSubview(self.rightLabel)
        
        self.underLineView = UIView.init(frame: CGRect(x: 0, y: 45, width: SCREENWIDTH / 3, height: 3))
        self.underLineView.backgroundColor = .orange
        self.topView.addSubview(self.underLineView)
    
        
        self.scrollView = UIScrollView()
        self.scrollView.showsVerticalScrollIndicator = false        // 隐藏滑动条
        self.scrollView.showsHorizontalScrollIndicator = false      // 隐藏滑动条
        self.scrollView.backgroundColor = colorWithHex(hexColorStr: "#F6F7F9")
        self.scrollView.contentSize = CGSize(width: SCREENWIDTH * 3, height: CONTENTVIEWHEIGHT)
        self.scrollView.isPagingEnabled = true                      // 可分页
        self.scrollView.delegate = self
        self.addSubview(self.scrollView)
        
        self.scrollView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(CONTENTVIEWHEIGHT)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.snp_topMargin).offset(45)
        }
    }
    
    
    
    @objc func LeftTap(tap: UIGestureRecognizer) {
        
        print("LEFT")
        UIView.animate(withDuration: 0.2) {
            
            var frame = self.underLineView.frame
            let origin = 0.0
            frame.origin.x = origin
            self.underLineView.frame = frame
            self.leftLabel.textColor = .orange
            self.middleLabel.textColor = colorWithHex(hexColorStr: "#333333")
            self.rightLabel.textColor = colorWithHex(hexColorStr: "#333333")
        }
    }
    
    @objc func MiddleTap(tap: UIGestureRecognizer) {
        
        print("MIDDLE")
        UIView.animate(withDuration: 0.2) {
            
            var frame = self.underLineView.frame
            let origin = SCREENWIDTH / 3
            frame.origin.x = origin
            self.underLineView.frame = frame
            self.leftLabel.textColor = colorWithHex(hexColorStr: "#333333")
            self.middleLabel.textColor = .orange
            self.rightLabel.textColor = colorWithHex(hexColorStr: "#333333")
        }
    }
    
    @objc func RightTap(tap: UIGestureRecognizer) {
        
        print("RIGHT")
        UIView.animate(withDuration: 0.2) {
            
            var frame = self.underLineView.frame
            let origin = SCREENWIDTH / 3 * 2
            frame.origin.x = origin
            self.underLineView.frame = frame
            self.leftLabel.textColor = colorWithHex(hexColorStr: "#333333")
            self.middleLabel.textColor = colorWithHex(hexColorStr: "#333333")
            self.rightLabel.textColor = .orange
        }
    }
}



extension PagesView: UIScrollViewDelegate {
    
    // MARK: - 监听滑动
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        switch scrollView.contentOffset.x {
            
        case 0:
            print("第1页")
            UIView.animate(withDuration: 0.2) {
                
                var frame = self.underLineView.frame
                let origin = 0.0
                frame.origin.x = origin
                self.underLineView.frame = frame
                self.leftLabel.textColor = .orange
                self.middleLabel.textColor = colorWithHex(hexColorStr: "#333333")
                self.rightLabel.textColor = colorWithHex(hexColorStr: "#333333")
            }
            break
            
        case SCREENWIDTH:
            print("第2页")
            UIView.animate(withDuration: 0.2) {
                
                var frame = self.underLineView.frame
                let origin = SCREENWIDTH / 3
                frame.origin.x = origin
                self.underLineView.frame = frame
                self.leftLabel.textColor = colorWithHex(hexColorStr: "#333333")
                self.middleLabel.textColor = .orange
                self.rightLabel.textColor = colorWithHex(hexColorStr: "#333333")
            }
            break
            
        case SCREENWIDTH * 2:
            print("第3页")
            UIView.animate(withDuration: 0.2) {
                
                var frame = self.underLineView.frame
                let origin = SCREENWIDTH / 3 * 2
                frame.origin.x = origin
                self.underLineView.frame = frame
                self.leftLabel.textColor = colorWithHex(hexColorStr: "#333333")
                self.middleLabel.textColor = colorWithHex(hexColorStr: "#333333")
                self.rightLabel.textColor = .orange
            }
            break
            
        default:
            break
        }
    }
}
