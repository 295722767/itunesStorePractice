//
//  AppFullScreenController.swift
//  AppStoreJSONApis
//
//  Created by Mao Li on 5/7/19.
//  Copyright © 2019 MaoLi. All rights reserved.
//

import UIKit

class AppFullScreenController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = .white
        self.tableView.separatorStyle = .none

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 0 {
            let cell = UITableViewCell()
            let todayCell = TodayCell()
            cell.addSubview(todayCell)
            todayCell.translatesAutoresizingMaskIntoConstraints = false
            todayCell.widthAnchor.constraint(equalToConstant: 250).isActive = true
            todayCell.heightAnchor.constraint(equalToConstant: 250).isActive = true
            todayCell.centerXAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
            todayCell.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
            cell.selectionStyle = .none
            return cell
        }
        let cell = AppFullScreenDescriptionCell()
        cell.selectionStyle = .none
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
}
