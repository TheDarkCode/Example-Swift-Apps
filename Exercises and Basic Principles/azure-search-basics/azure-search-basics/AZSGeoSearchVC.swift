//
//  AZSGeoSearchVC.swift
//  azure-search-basics
//
//  Created by Mark Hamilton on 3/11/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit
import MapKit

class AZSGeoSearchVC: AZSViewController, GeoSearch, UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var map: MKMapView!
    
    let locationManager = CLLocationManager()
    
    var regionRadius: CLLocationDistance = 1000

    
    override func viewDidLoad() {
        super.viewDidLoad()

        map.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        locationAuthStatus()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationAuthStatus() {
        
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
        
            map.showsUserLocation = true
        
        } else {
        
            locationManager.requestWhenInUseAuthorization()
        
        }
        
    }
    
    // MARK: - GeoSearch Protocol Methods
    
    func locateWithCoordinates(Longitude lon: Double, Latitude lat: Double, locationTitle title: String?) {
        
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            
            let position = CLLocationCoordinate2DMake(lat, lon)
            self.centerMapOnCoordinate2D(position)
            
        }
        
    }
    
    
    // MARK: - Map and Annotations
    
    func centerMapOnLocation(location: CLLocation) {
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2, regionRadius * 2)
        map.setRegion(coordinateRegion, animated: true)
        
    }
    
    func centerMapOnCoordinate2D(location: CLLocationCoordinate2D) {
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location, regionRadius * 2, regionRadius * 2)
        map.setRegion(coordinateRegion, animated: true)
        
    }
    
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        
        if let loc = userLocation.location {
        
            centerMapOnLocation(loc)
        
        }
        
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation.isKindOfClass(MKAnnotation) {
            
            let annoView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "Default")
            
            annoView.pinTintColor = UIColor.blueColor()
            annoView.animatesDrop = true
            
            return annoView
        
        } else if annotation.isKindOfClass(MKUserLocation) {
            
            return nil
        }
        
        return nil
        
    }
    
    func createAnnotationFromAddress(location: CLLocation) {
        
        let annotation = AZSMapAnnotation(coordinate: location.coordinate)
        map.addAnnotation(annotation)
        
    }
    
    func getPlacemarkFromAddress(address: String) {
        
        CLGeocoder().geocodeAddressString(address) {
            
            (placemarks: [CLPlacemark]?, error: NSError?) -> Void in
            
            if let marks = placemarks where marks.count > 0 {
                
                if let loc = marks[0].location {
                
                    // valid location with coordinates
                    self.createAnnotationFromAddress(loc)
                    
                }
                
            }
            
        }
        
    }
    
    // MARK: - Table View
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

}
