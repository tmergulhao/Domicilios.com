//
//  TableViewController.swift
//  Domicilios.com
//
//  Created by Tiago Mergulhão on 09/10/16.
//  Copyright © 2016 Tiago Mergulhão. All rights reserved.
//

import Foundation

// MARK: UITableViewController

class TableViewController: UITableViewController {
    
    var dataSource : DataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = DataSource(tableView: self.tableView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
