//
//  DataSource.swift
//  Domicilios.com
//
//  Created by Tiago Mergulhão on 09/10/16.
//  Copyright © 2016 Tiago Mergulhão. All rights reserved.
//

import UIKit

import AFNetworking

// MARK: NSObject

class DataSource : NSObject {
    let tableView : UITableView
    let cellReuseId : String = "Entry Cell"
    
    init(tableView : UITableView) {
        self.tableView = tableView
    }
}

// MARK: UITableViewDataSource

extension DataSource : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 4
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath)
        
        //let index = indexPath.row
        
        cell.backgroundColor = UIColor.clear
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nil
    }
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return nil
    }
}
