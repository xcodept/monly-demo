//
//  GPSViewController.swift
//  monly-demo
//
//  Created by studium on 09.06.19.
//  Copyright © 2019 codefuse. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class GPSViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var mapView: MKMapView! {
        didSet {
            self.mapView.showsUserLocation = true
            self.mapView.delegate = self
        }
    }
    @IBOutlet weak var locationButton: UIButton! {
        didSet {
            self.locationButton.setTitle("Refresh Location", for: .normal)
        }
    }
    
    // MARK: - Properties
    private let locationManager = CLLocationManager()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "GPS"
        
        //
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestAlwaysAuthorization() //.requestWhenInUseAuthorization() //.requestAlwaysAuthorization()
        self.locationManager.delegate = self
    }
    
    // MARK: - Action methods
    @IBAction func locationButtonDidClicked(_ sender: Any) {
        guard CLLocationManager.locationServicesEnabled() == true else {
            // TODO: alert
            print("alert")
            return
        }
        
        self.locationManager.startUpdatingLocation()
    }
    
}

extension GPSViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate = locations.last?.coordinate else {
            // TODO: alert
            print("alert")
            return
        }
        self.mapView.setCenter(coordinate, animated: true)
    }
}

extension GPSViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        mapView.setCenter(userLocation.coordinate, animated: true)
    }
}
