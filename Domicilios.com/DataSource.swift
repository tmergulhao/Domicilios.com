//
//  DataSource.swift
//  Domicilios.com
//
//  Created by Tiago Mergulhão on 09/10/16.
//  Copyright © 2016 Tiago Mergulhão. All rights reserved.
//

import UIKit
import MapKit

import AFNetworking

// MARK: NSObject

class DataSource : NSObject {
    
    static var data : Array<FoodPlace> = []
    
    let cellReuseId : String = "Entry Cell"
    
    @IBOutlet var tableView : UITableView?
    @IBOutlet var mapView : MapView? // MKMapView
    
    override init () {
        super.init()
        
        fetchData()
    }
    
    func fetchData () {
        if !DataSource.data.isEmpty {
            return
        }
        
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
                    DataSource.data = array
                        .flatMap { try? FoodPlace(dictionary: $0) }
                }
                
                self.fetchImages()
                
                self.tableView?.reloadData()
                self.mapView?.reloadData()
            },
            failure: {
                data, error in
                print(error)
            })
    }
    
    func fetchImages () {
        let imageManager = AFHTTPSessionManager()
        
        imageManager.responseSerializer = AFImageResponseSerializer()
        
        for record in DataSource.data {
            
            imageManager.get(
                record.logoPath,
                parameters: nil,
                progress: {
                    progress in
                    return
                },
                success: {
                    session, object in
                    
                    if let image = object as? UIImage {
                        record.image = image
                        print("SUCCESS FOR \(record.name)")
                        self.tableView?.reloadData()
                        self.mapView?.reloadData()
                    } else {
                        print("FAILED TO LOAD \(record.logoPath) FOR \(record.name)")
                    }
                },
                failure: {
                    task, error in
                    
                    return
                })
        }
    }
}

protocol MKMapViewDataSource : NSObjectProtocol {
    func numberOfSections(in mapView: MKMapView) -> Int
    func mapView(_ mapView: MKMapView, numberOfAnnotationsInSection section: Int) -> Int
    func mapView(_ mapView: MKMapView, annotationForRowAt indexPath: IndexPath) -> MKAnnotation
    func mapView(_ mapView: MKMapView, regionForSection section: Int) -> MKCoordinateRegion
}

// MARK: MKMapViewDataSource

extension DataSource : MKMapViewDataSource {
    func numberOfSections(in mapView: MKMapView) -> Int {
        return 1
    }
    
    func mapView(_ mapView: MKMapView, numberOfAnnotationsInSection section: Int) -> Int {
        return DataSource.data.count
    }
    
    func mapView(_ mapView: MKMapView, annotationForRowAt indexPath: IndexPath) -> MKAnnotation {
        let record = DataSource.data[indexPath.row]
        
        return MapViewAnnotation(record: record)
    }
    
    func mapView(_ mapView: MKMapView, regionForSection section: Int) -> MKCoordinateRegion {
        let latitude = (
            max: DataSource.data.reduce(-180, {
                oldValue, record in
                return oldValue < record.latitude ? record.latitude : oldValue
            }),
            min: DataSource.data.reduce(+180, {
                oldValue, record in
                return oldValue > record.latitude ? record.latitude : oldValue
            })
        )
        let longitude = (
            max: DataSource.data.reduce(-180, {
                oldValue, record in
                return oldValue < record.longitude ? record.longitude : oldValue
            }),
            min: DataSource.data.reduce(+180, {
                oldValue, record in
                return oldValue > record.longitude ? record.longitude : oldValue
            })
        )
        
        let latitudeDelta = (latitude.max - latitude.min)/2
        let longitudeDelta = (longitude.max - longitude.min)/2
        
        let coordinate = CLLocationCoordinate2D(latitude: latitude.min + latitudeDelta, longitude: longitude.min + longitudeDelta)
        let span : MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latitudeDelta * 3, longitudeDelta: longitudeDelta * 3)
        
        return MKCoordinateRegion(center: coordinate, span: span)
    }
}

// MARK: UITableViewDataSource

extension DataSource : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataSource.data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let record = DataSource.data[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath) as? EntryCell {
            cell.title.text = record.name
            cell.category.text = record.category.rawValue
            
            if let image = record.image {
                cell.logo.image = image
            } else {
                cell.logo.image = StyleKit.imageOfDeliveries()
            }
            
            cell.backgroundColor = UIColor.clear
            
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
