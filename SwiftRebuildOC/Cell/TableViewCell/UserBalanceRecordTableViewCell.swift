//
//  UserBalanceRecordTableViewCell.swift
//  SwiftRebuildOC
//
//  Created by Benjamin on 2022/1/20.
//  Copyright © 2022 com.Personal.Benjamin. All rights reserved.
//

import UIKit

class UserBalanceRecordTableViewCell: UITableViewCell {
    
    var titleLabel: UILabel!
    var moneyLabel: UILabel!
    var dateLabel: UILabel!
    var noticeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .white
        self.createCellUI()
    }
    
    func createCellUI() {
        
        self.titleLabel = UILabel()
        self.addSubview(self.titleLabel)
        
        self.moneyLabel = UILabel()
        self.addSubview(self.moneyLabel)
        
        self.dateLabel = UILabel()
        self.addSubview(self.dateLabel)
        
        self.noticeLabel = UILabel()
        self.addSubview(self.noticeLabel)
        
        
        
        self.titleLabel.snp.makeConstraints { make in
            make.width.greaterThanOrEqualTo(0)
            make.height.equalTo(16)
            make.left.equalTo(self.snp_leftMargin).offset(12)
            make.top.equalTo(self.snp_topMargin).offset(3)
        }
        
        self.moneyLabel.snp.makeConstraints { make in
            make.width.greaterThanOrEqualTo(0)
            make.height.equalTo(18)
            make.right.equalTo(self.snp_rightMargin).offset(-12)
            make.top.equalTo(self.titleLabel)
        }
        
        self.dateLabel.snp.makeConstraints { make in
            make.width.greaterThanOrEqualTo(0)
            make.height.equalTo(14)
            make.left.equalTo(self.titleLabel)
            make.bottom.equalTo(self.snp_bottomMargin).offset(0)
        }
        
        self.noticeLabel.snp.makeConstraints { make in
            make.width.greaterThanOrEqualTo(0)
            make.height.equalTo(14)
            make.right.equalTo(self.moneyLabel.snp_rightMargin)
            make.top.equalTo(self.dateLabel)
        }
    }
    
    
    
    func loadCellData(userBalanceRecord: UserBalanceRecord) {
        
        if userBalanceRecord.type == 1 {
            
            // type == 1：增加
            labelProperty(label: self.titleLabel, bgColor: .clear, bgColorStr: "", textStr: userBalanceRecord.remark!, textColor: .red, textColorStr: "", textFont: 16.0, textAlignment: .left)
            
        } else if userBalanceRecord.type == 2 {
            
            // type == 2：扣除
            labelProperty(label: self.titleLabel, bgColor: .clear, bgColorStr: "", textStr: userBalanceRecord.remark!, textColor: .green, textColorStr: "", textFont: 16.0, textAlignment: .left)
        }
        
        labelProperty(label: self.moneyLabel, bgColor: .clear, bgColorStr: "", textStr: String(format: "%.1f元", userBalanceRecord.money!), textColor: .clear, textColorStr: "#333333", textFont: 18.0, textAlignment: .right)
        
        labelProperty(label: self.dateLabel, bgColor: .clear, bgColorStr: "", textStr: getCurrentTime(), textColor: .clear, textColorStr: "#999999", textFont: 14.0, textAlignment: .left)
        
        
        labelProperty(label: self.noticeLabel, bgColor: .clear, bgColorStr: "", textStr: "", textColor: .clear, textColorStr: "#999999", textFont: 14.0, textAlignment: .right)
        
        switch userBalanceRecord.notice {
            
        case 0:
            self.noticeLabel.text = "历史数据，类型未知"
            break
            
        case 1:
            self.noticeLabel.text = "提现"
            break
            
        case 2:
            self.noticeLabel.text = "提现退回"
            break
            
        case 3:
            self.noticeLabel.text = "CPL 奖励"
            break
            
        case 4:
            self.noticeLabel.text = "签到奖励"
            break
            
        case 5:
            self.noticeLabel.text = "加成卡奖励"
            break
            
        case 6:
            self.noticeLabel.text = "注册赠送"
            break
            
        case 7:
            self.noticeLabel.text = "运营赔付"
            break
            
        case 8:
            self.noticeLabel.text = "运营扣回"
            break
            
        default:
            self.noticeLabel.text = "其他"
            break
        }
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
