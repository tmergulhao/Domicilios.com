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
        tableView.dataSource = dataSource
        
        //tableView.backgroundView = nil
        //tableView.layer.backgroundColor = UIColor.clear.cgColor
        tableView.backgroundColor = UIColor.clear
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
