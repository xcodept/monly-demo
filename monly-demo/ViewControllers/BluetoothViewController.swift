//
//  BluetoothViewController.swift
//  monly-demo
//
//  Created by studium on 09.06.19.
//  Copyright © 2019 codefuse. All rights reserved.
//

import UIKit
import SensingKit

class BluetoothViewController: UIViewController {
    
    // MARK: - Properties
    private let sensingKit = SensingKitLib.shared()
    
    // MARK: - Outlets
    @IBOutlet weak var iBeaconProxmityButton: UIButton! {
        didSet {
            self.iBeaconProxmityButton.setTitle("Use iBeaconProximity", for: .normal)
        }
    }
    
    @IBOutlet weak var eddystoneProximityButton: UIButton! {
        didSet {
            self.eddystoneProximityButton.setTitle("Use EddystoneProximity", for: .normal)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Bluetooth"
    }
    
    // MARK: - Methods
    private func getEddystoneProximity() {
        try? self.sensingKit.stopContinuousSensingWithAllRegisteredSensors()
        
        if self.sensingKit.isSensorAvailable(SKSensorType.EddystoneProximity) {
            
            try? self.sensingKit.register(SKSensorType.EddystoneProximity)
            try? self.sensingKit.subscribe(to: SKSensorType.EddystoneProximity, withHandler: { (sensorType, sensorData, error) in
                
                if let sensorData = sensorData as? SKEddystoneProximityData {
                    print("EddystoneProximity: \(sensorData)")
                }
                try? self.sensingKit.deregister(SKSensorType.EddystoneProximity)
            })
            
            try? self.sensingKit.startContinuousSensing(with: SKSensorType.EddystoneProximity)
            
        }
    }
    
    private func getiBeaconProxmity() {
        try? self.sensingKit.stopContinuousSensingWithAllRegisteredSensors()
        
        if self.sensingKit.isSensorAvailable(SKSensorType.iBeaconProximity) {
            
            try? self.sensingKit.register(SKSensorType.iBeaconProximity)
            try? self.sensingKit.subscribe(to: SKSensorType.iBeaconProximity, withHandler: { (sensorType, sensorData, error) in
                
                if let sensorData = sensorData as? SKiBeaconDeviceData {
                    print("iBeaconProximity: \(sensorData)")
                }
                try? self.sensingKit.deregister(SKSensorType.iBeaconProximity)
            })
            
            try? self.sensingKit.startContinuousSensing(with: SKSensorType.iBeaconProximity)
            
        }
    }
    
    // MARK: - Action methods
    @IBAction func iBeaconProxmityButtonDidClicked(_ sender: Any) {
        self.getiBeaconProxmity()
    }
    
    @IBAction func eddystoneProximityButtonDidClicked(_ sender: Any) {
        self.getEddystoneProximity()
    }
}
