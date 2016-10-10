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
    var data : Array<FoodPlace> = []
    
    init(tableView : UITableView) {
        self.tableView = tableView
        
        super.init()
        
        fetchData()
    }
    
    func fetchData () {
        let manager = AFHTTPSessionManager()
        
        manager.responseSerializer = AFJSONResponseSerializer()
        
        manager.get(
            "https://api.myjson.com/bins/1zib8",
            parameters: nil,
            progress: {
                progress in
                return
            },
            success: {
                (task, any : Any?) -> Void in
                
                if let array = any as? Array<Dictionary<String,Any>> {
                    self.data = array
                        .map{ try? FoodPlace(dictionary: $0) }
                        .filter{ $0 != nil }
                        .map{ $0! }
                }
            }, failure: {
                data, error in
                print(error)
        })
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
