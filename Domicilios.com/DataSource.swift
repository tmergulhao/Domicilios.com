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
        fetchImages()
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
                        .flatMap { try? FoodPlace(dictionary: $0) }
                }
                
                self.tableView.reloadData()
            }, failure: {
                data, error in
                print(error)
        })
    }
    
    func fetchImages () {
        let imageManager = AFHTTPSessionManager()
        
        imageManager.responseSerializer = AFImageResponseSerializer()
        
        self.data = self.data.map({
            record -> FoodPlace in
            
            imageManager.get(
                record.logoPath,
                parameters: nil,
                progress: {
                    progress in
                    return
                }, success: {
                    session, object in
                    
                    if let image = object as? UIImage {
                        record.image = image
                        print("SUCCESS FOR \(record.name)")
                        self.tableView.reloadData()
                    } else {
                        print("FAILED TO LOAD \(record.logoPath) FOR \(record.name)")
                    }
                },
                failure: {
                    task, error in
                    return
                })
            
            return record
        })
    }
}

// MARK: UITableViewDataSource

extension DataSource : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath) as? EntryCell {
            cell.title.text = data[indexPath.row].name
            cell.category.text = data[indexPath.row].category.rawValue
            
            cell.backgroundColor = UIColor.clear
            
            print(data[indexPath.row].image)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nil
    }
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return nil
    }
}
