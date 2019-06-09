//
//  GPSViewController.swift
//  monly-demo
//
//  Created by studium on 09.06.19.
//  Copyright © 2019 codefuse. All rights reserved.
//

import UIKit
import SensingKit
import MapKit
import CoreLocation

class GPSViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var mapView: MKMapView! {
        didSet {
            self.mapView.showsUserLocation = true
        }
    }
    @IBOutlet weak var locationButton: UIButton! {
        didSet {
            self.locationButton.setTitle("Refresh Location", for: .normal)
        }
    }
    
    // MARK: - Properties
    private let sensingKit = SensingKitLib.shared()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "GPS"
    }
    
    // MARK: -
    private func getLocation() {
        try? self.sensingKit.stopContinuousSensingWithAllRegisteredSensors()
        
        if self.sensingKit.isSensorAvailable(SKSensorType.Location) {
            
            try? self.sensingKit.register(SKSensorType.Location)
            try? self.sensingKit.subscribe(to: SKSensorType.Location, withHandler: { (sensorType, sensorData, error) in
                
                if let sensorData = sensorData as? SKLocationData {
                    print("location: \(sensorData)")
                    self.mapView.setCenter(sensorData.location.coordinate, animated: true)
                }
                try? self.sensingKit.deregister(SKSensorType.Location)
            })
            
            try? self.sensingKit.startContinuousSensing(with: SKSensorType.Location)
            
        }
    }
    
    // MARK: - Action methods
    @IBAction func locationButtonDidClicked(_ sender: Any) {
        self.getLocation()
    }
}
