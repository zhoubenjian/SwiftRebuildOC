//
//  SimpleCalculatorView.swift
//  SwiftRebuildOC
//
//  Created by 周本健 on 2020/5/26.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit
import SnapKit

class SimpleCalculatorView: UIView {
    
    var resultTxt: UITextField!
    var resultBtn: UIButton!    // =
    var cleanBtn: UIButton!     // 清空
    
    var SCCollectionView: UICollectionView!
    
    // 懒加载
    lazy var layout: UICollectionViewFlowLayout! = {() -> UICollectionViewFlowLayout in
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (SCREENWIDTH - 3) / 4, height: (SCREENWIDTH - 3) / 4)
        layout.sectionInset = UIEdgeInsets(top: 0.5, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0.5
        layout.minimumInteritemSpacing = 0.5
        return layout
    }()
    
    var operateArray: Array<String>!
    var inputStr: String! = String.init()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.createViewUI()
    }
    
    func createViewUI() {
        
        self.resultTxt = UITextField()
        self.resultTxt.backgroundColor = .lightGray
        self.addSubview(self.resultTxt)
        
        self.resultBtn = UIButton()
        self.resultBtn.layer.masksToBounds = true
        self.resultBtn.layer.cornerRadius = 10
        buttonProperty(btn: self.resultBtn, bgColor: .red, bgColorStr: "", titleStr: "=", titleFont: 15.0, titleColorStr: "#000000", titleAlignment: .center)
        self.resultBtn.addTarget(self, action: #selector(result), for: .touchUpInside)
        self.addSubview(self.resultBtn)
        
        self.cleanBtn = UIButton()
        self.cleanBtn.layer.masksToBounds = true
        self.cleanBtn.layer.cornerRadius = 10
        buttonProperty(btn: self.cleanBtn, bgColor: .green, bgColorStr: "", titleStr: "C", titleFont: 15.0, titleColorStr: "#000000", titleAlignment: .center)
        self.cleanBtn.addTarget(self, action: #selector(clean), for: .touchUpInside)
        self.addSubview(self.cleanBtn)
        
        self.SCCollectionView = UICollectionView.init(frame: .zero, collectionViewLayout: self.layout)
        self.SCCollectionView.backgroundColor = .lightGray
        self.SCCollectionView.showsVerticalScrollIndicator = false
        self.SCCollectionView.isScrollEnabled = false
        // 注册
        self.SCCollectionView.register(SimpleCalculatorCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "sc")
        self.SCCollectionView.delegate = self
        self.SCCollectionView.dataSource = self
        self.addSubview(self.SCCollectionView)
        
        
        
        self.resultTxt.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(50)
        }
        
        self.resultBtn.snp.makeConstraints { (make) in
            make.width.equalTo((SCREENWIDTH - 150) / 2)
            make.height.equalTo((SCREENWIDTH - 150) / 2 * 0.618)
            make.left.equalTo(self.snp_left).offset(50)
            make.top.equalTo(self.resultTxt.snp_bottom).offset(10)
        }
        
        self.cleanBtn.snp.makeConstraints { (make) in
            make.width.equalTo(self.resultBtn)
            make.height.equalTo(self.resultBtn)
            make.right.equalTo(self.snp_right).offset(-50)
            make.top.equalTo(self.resultBtn)
        }
        
        self.SCCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.resultBtn.snp_bottom).offset(10)
            make.bottom.left.right.equalToSuperview()
        }
    }
    
    // 加载数据
    func loadData(operateArray: Array<String>) {
        self.operateArray = operateArray
        if self.operateArray != nil && self.operateArray.count > 0 {
            // 刷新数据
            self.SCCollectionView.reloadData()
        }
    }
    
    // 计算
    func calculateResult(inputStr: String) -> String {
        
        var strArray: [Substring]!
        var result: Float! = 0
        
        if inputStr.contains("+") {
            
            // 根据运算符分割字符串
            strArray = inputStr.split(separator: "+")
            // 加法（可以直接累加）
            for sub in strArray {
                result += (sub as NSString).floatValue
            }
            
        } else if inputStr.contains("-") {
            
            // 根据运算符分割字符串
            strArray = inputStr.split(separator: "-")
            // 减法
            for i in 0..<strArray.count {
                if i == 0 {
                    result = (strArray[i] as NSString).floatValue
                } else {
                    result -= (strArray[i] as NSString).floatValue
                }
            }
            
        } else if inputStr.contains("*") {
            
            // 根据运算符分割字符串
            strArray = inputStr.split(separator: "*")
            // 乘法
            for i in 0..<strArray.count {
                if i == 0 {
                    result = (strArray[i] as NSString).floatValue
                } else {
                    result *= (strArray[i] as NSString).floatValue
                }
            }
            
        } else if inputStr.contains("/") {
            
            // 根据运算符分割字符串
            strArray = inputStr.split(separator: "/")
            // 除法
            for i in 0..<strArray.count {
                if i == 0 {
                    result = (strArray[i] as NSString).floatValue
                } else {
                    result /= (strArray[i] as NSString).floatValue
                }
            }
            
        }
        
        return result.cleanZero
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    @objc func result() {
        
        // 运算
        self.resultTxt.text = calculateResult(inputStr: self.inputStr)
        
        // 更新输入内容
        self.inputStr = self.resultTxt.text
        
    }
    
    // 清空输入内容
    @objc func clean() {
        self.resultTxt.text = ""
        self.inputStr = ""
    }
    
}

// MARK： - Float Extension（去除浮点型小数点后多余的0）
extension Float {

    var cleanZero: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }

}

// MARK: - UICollectionView delegate & dataSource
extension SimpleCalculatorView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.operateArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SimpleCalculatorCollectionViewCell! = collectionView.dequeueReusableCell(withReuseIdentifier: "sc", for: indexPath) as? SimpleCalculatorCollectionViewCell
        labelProperty(label: cell.operateLabel, bgColor: .white, bgColorStr: "", textStr: self.operateArray[indexPath.row], textColor: .gray, textColorStr: "", textFont: 15.0, textAlignment: .center)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell: SimpleCalculatorCollectionViewCell! = collectionView.cellForItem(at: indexPath) as? SimpleCalculatorCollectionViewCell
        let str: String! = cell.operateLabel.text!
        self.inputStr.append(str)
        self.resultTxt.text = self.inputStr ?? ""
    }
    
    // 是否开启点击时颜色
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // 点击时颜色
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell: SimpleCalculatorCollectionViewCell! = collectionView.cellForItem(at: indexPath) as? SimpleCalculatorCollectionViewCell
        cell.operateLabel.backgroundColor = .lightGray
    }
    
    // 离开时颜色
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell: SimpleCalculatorCollectionViewCell! = collectionView.cellForItem(at: indexPath) as? SimpleCalculatorCollectionViewCell
        cell.operateLabel.backgroundColor = .white
    }
    
}
