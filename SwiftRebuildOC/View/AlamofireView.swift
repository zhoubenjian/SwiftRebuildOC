//
//  AlamofireView.swift
//  SwiftRebuildOC
//
//  Created by Benjamin on 2022/1/18.
//  Copyright © 2022 com.Personal.Benjamin. All rights reserved.
//

import UIKit

class AlamofireView: UIView {
    
    var URLTxt: UITextView!
    var paramsTxt: UITextView!
    
    var GetWithNoParamsBtn: UIButton!
    
    var cleanBtn: UIButton!

    var submitBtn: UIButton!
    
    typealias NetWorkingClosure = () -> Void
    var netWorkingClosure: NetWorkingClosure!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.createViewUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func createViewUI() {
        
        self.URLTxt = UITextView()
        self.URLTxt.backgroundColor = .yellow
        self.addSubview(self.URLTxt)
        
        self.paramsTxt = UITextView()
        self.paramsTxt.backgroundColor = .green
        self.addSubview(self.paramsTxt)
        
        self.GetWithNoParamsBtn = UIButton()
        self.GetWithNoParamsBtn.layer.masksToBounds = true
        self.GetWithNoParamsBtn.layer.cornerRadius = 15
        buttonProperty(btn: self.GetWithNoParamsBtn, bgColor: .orange, bgColorStr: "", titleStr: "无参Get", titleFont: 13.0, titleColorStr: "#FFFFFF", titleAlignment: .center)
        /*** 无参Get点击方法 ***/
        self.GetWithNoParamsBtn.addTarget(self, action: #selector(GetWithNoParams), for: .touchUpInside)
        /*** 无参Get点击方法 ***/
        self.addSubview(self.GetWithNoParamsBtn)
        
        self.cleanBtn = UIButton()
        self.cleanBtn.layer.masksToBounds = true
        self.cleanBtn.layer.cornerRadius = 15
        buttonProperty(btn: self.cleanBtn, bgColor: .blue, bgColorStr: "", titleStr: "清空", titleFont: 13.0, titleColorStr: "#FFFFFF", titleAlignment: .center)
        /*** 清空 ***/
        self.cleanBtn.addTarget(self, action: #selector(Clean), for: .touchUpInside)
        /*** 清空 ***/
        self.addSubview(self.cleanBtn)
        
        self.submitBtn = UIButton()
        self.submitBtn.layer.masksToBounds = true
        self.submitBtn.layer.cornerRadius = 25
        buttonProperty(btn: self.submitBtn, bgColor: .purple, bgColorStr: "", titleStr: "发送请求", titleFont: 18.0, titleColorStr: "#FFFFFF", titleAlignment: .center)
        self.submitBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
        /*** 发送请求 ***/
        self.submitBtn.addTarget(self, action: #selector(Submit), for: .touchUpInside)
        /*** 发送请求 ***/
        self.addSubview(self.submitBtn)
        
        
        
        self.URLTxt.snp.makeConstraints { make in
            make.width.equalTo(SCREENWIDTH - 50)
            make.height.greaterThanOrEqualTo(100)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.snp_topMargin).offset(20)
        }
        
        self.paramsTxt.snp.makeConstraints { make in
            make.width.equalTo(SCREENWIDTH - 50)
            make.height.greaterThanOrEqualTo(100)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.URLTxt.snp_bottomMargin).offset(30)
        }
        
        self.GetWithNoParamsBtn.snp.makeConstraints { make in
            make.width.equalTo(70.0)
            make.height.equalTo(30)
            make.left.equalTo(self.snp_leftMargin).offset((SCREENWIDTH - 280.0) / 5.0)
            make.top.equalTo(self.paramsTxt.snp_bottomMargin).offset(50)
        }
        
        self.cleanBtn.snp.makeConstraints { make in
            make.width.equalTo(self.GetWithNoParamsBtn)
            make.height.equalTo(self.GetWithNoParamsBtn)
            make.right.equalTo(self.snp_rightMargin).offset(-(SCREENWIDTH - 280.0) / 5.0)
            make.top.equalTo(self.GetWithNoParamsBtn)
        }
        
        self.submitBtn.snp.makeConstraints { make in
            make.width.equalTo(SCREENWIDTH - 100)
            make.height.equalTo(50)
            make.centerX.equalTo(self)
            make.top.equalTo(self.GetWithNoParamsBtn.snp_bottomMargin).offset(50)
        }
    }

    
    
    @objc func GetWithNoParams() {
        
        self.URLTxt.text = "http://www.umiblog.cn/api/ppy/usercenter/system/config"
        self.paramsTxt.text = ""
    }
    
    @objc func Clean() {
        
        self.URLTxt.text = ""
        self.paramsTxt.text = ""
    }
    
    @objc func Submit() {
        
        if (self.URLTxt.text.isEmpty &&
            (!self.URLTxt.text.hasPrefix("http://") || !self.URLTxt.text.hasPrefix("https://"))) {
            
            PKHUDShow(str: "链接不能为空 或者 错误")
            
        } else {
            
            self.netWorkingClosure()
        }
        
    }
}
