//
//  SwipeDeleteVC.swift
//  SwiftRebuildOC
//
//  Created by 周本健 on 2020/11/12.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit

class SwipeDeleteVC: BaseVC {

    var mainView: SwipeDeleteView!
    var dataArray: [String]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "SwipeDeleteVC"
        self.view.backgroundColor = .white
        self.dataArray = ["George Washington", "John Adams", "Thomas Jefferson", "James Madison", "James Monroe",
                          "John Quincy Adams", "Andrew Jackson", "Martin van Buren", "William Henry Harrison",
                          "John Tyler", "James Knox Polk", "Zachary Taylor", "Millard Fillmore", "Franklin Pierce",
                          "James Buchanan", "Abraham Lincoln", "Andrew Johnson", "Ulysses Simpson Grant",
                          "Rutherford B. Hays", "James Garfield", "Chester A.Arthur", "Stephen Grover Cleveland",
                          "Benjamin Harrison", "Stephen Grover Cleveland", "William McKinley", "Theodore Roosevelt",
                          "William Howard Taft", "Thomas Woodrow Wilson", "Warren Gamaliel Harding",
                          "John Calvin Coolidge", "Herbert Clark Hoover", "Franklin Delano Roosevelt", "Harry S.Truman",
                          "Dwight D.Eisenhower", "John Fitzgerald Kennedy", "Lyndon Baines Johnson",
                          "Richard Milhous Nixon", "Gerald Rudolph Ford", "Jimmy Carter", "Ronald Wilson Reagan",
                          "George Herbert Walker Bush", "William Jefferson Clinton", "George Walker Bush",
                          "Barack Hussein Obama", "Donald Trump", "Joe Biden"]
        self.createUI()
    }
    
    func createUI() {
        
        self.mainView = SwipeDeleteView();
        self.mainView.loadData(dataArray: self.dataArray)
        self.view.addSubview(self.mainView)
        
        
        
        self.mainView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

}
