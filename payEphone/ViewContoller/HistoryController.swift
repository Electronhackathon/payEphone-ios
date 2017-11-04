//
//  HistoryController.swift
//  payEphone
//
//  Created by 윤영채 on 2017. 11. 4..
//  Copyright © 2017년 윤영채. All rights reserved.
//

import UIKit

class HistoryController: UIViewController {
    @IBOutlet weak var historyTableView: UITableView!
    
    var datas = [HistoryData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        historyTableView.delegate = self
        historyTableView.dataSource = self
        
        datas.append(HistoryData(title: "남영역점", price: "1000$", usageTime: "2017.07.23 - 11:30 ~ 12:30"))
        datas.append(HistoryData(title: "남영역점", price: "1000$", usageTime: "2017.07.23 - 11:30 ~ 12:30"))
        datas.append(HistoryData(title: "남영역점", price: "1000$", usageTime: "2017.07.23 - 11:30 ~ 12:30"))
        datas.append(HistoryData(title: "남영역점", price: "1000$", usageTime: "2017.07.23 - 11:30 ~ 12:30"))
        datas.append(HistoryData(title: "남영역점", price: "1000$", usageTime: "2017.07.23 - 11:30 ~ 12:30"))
        datas.append(HistoryData(title: "남영역점", price: "1000$", usageTime: "2017.07.23 - 11:30 ~ 12:30"))
        datas.append(HistoryData(title: "남영역점", price: "1000$", usageTime: "2017.07.23 - 11:30 ~ 12:30"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension HistoryController: UITableViewDelegate {
    
}

extension HistoryController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableCell", for: indexPath) as! HistoryTableCell
        let data = datas[indexPath.row]
        
        cell.title.text = data.title
        cell.price.text = data.price
        cell.usageTime.text = data.price
        
        return cell
    }
}

class HistoryTableCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var usageTime: UILabel!
}

class HistoryData {
    var title: String
    var price: String
    var usageTime: String
    
    init(title: String, price: String, usageTime: String) {
        self.title = title
        self.price = price
        self.usageTime = usageTime
    }
}
