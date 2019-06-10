//
//  SensorsViewController.swift
//  monly-demo
//
//  Created by studium on 09.06.19.
//  Copyright © 2019 codefuse. All rights reserved.
//

import UIKit
import SensingKit

class SensorsViewController: UIViewController {
    
    // MARK: - Properties
    private let sensingKit = SensingKitLib.shared()
    
    // MARK: - Outlets
    @IBOutlet weak var accelerometerButton: UIButton! {
        didSet {
            self.accelerometerButton.setTitle("Use Accelerometer", for: .normal)
        }
    }
    
    @IBOutlet weak var gyroscopeButton: UIButton! {
        didSet {
            self.gyroscopeButton.setTitle("Use Gyroscope", for: .normal)
        }
    }
    
    @IBOutlet weak var magnetometerButton: UIButton! {
        didSet {
            self.magnetometerButton.setTitle("Use Magnetometer", for: .normal)
        }
    }
    
    @IBOutlet weak var deviceMotionButton: UIButton! {
        didSet {
            self.deviceMotionButton.setTitle("Use DeviceMotion", for: .normal)
        }
    }
    
    @IBOutlet weak var motionActivityButton: UIButton! {
        didSet {
            self.motionActivityButton.setTitle("Use MotionActivity", for: .normal)
        }
    }
    
    @IBOutlet weak var pedometerButton: UIButton! {
        didSet {
            self.pedometerButton.setTitle("Use Pedometer", for: .normal)
        }
    }
    
    @IBOutlet weak var altimeterButton: UIButton! {
        didSet {
            self.altimeterButton.setTitle("Use Altimeter", for: .normal)
        }
    }
    
    @IBOutlet weak var headingButton: UIButton! {
        didSet {
            self.headingButton.setTitle("Use Heading", for: .normal)
        }
    }

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Sensors"
    }
    

    // MARK: - Methods
    private func getAccelerometer() {
        try? self.sensingKit.stopContinuousSensingWithAllRegisteredSensors()
        
        if self.sensingKit.isSensorAvailable(SKSensorType.Accelerometer) {
            
            try? self.sensingKit.register(SKSensorType.Accelerometer)
            try? self.sensingKit.subscribe(to: SKSensorType.Accelerometer, withHandler: { (sensorType, sensorData, error) in
                
                if let sensorData = sensorData as? SKAccelerometerData {
                    print("Accelerometer: \(sensorData)")
                }
                try? self.sensingKit.deregister(SKSensorType.Accelerometer)
            })
            
            try? self.sensingKit.startContinuousSensing(with: SKSensorType.Accelerometer)
            
        }
    }
    
    private func getAltimeter() {
        try? self.sensingKit.stopContinuousSensingWithAllRegisteredSensors()
        
        if self.sensingKit.isSensorAvailable(SKSensorType.Altimeter) {
            
            try? self.sensingKit.register(SKSensorType.Altimeter)
            try? self.sensingKit.subscribe(to: SKSensorType.Altimeter, withHandler: { (sensorType, sensorData, error) in
                
                if let sensorData = sensorData as? SKAltimeterData {
                    print("Altimeter: \(sensorData)")
                }
                try? self.sensingKit.deregister(SKSensorType.Altimeter)
            })
            
            try? self.sensingKit.startContinuousSensing(with: SKSensorType.Altimeter)
            
        }
    }
    
    private func getDeviceMotion() {
        try? self.sensingKit.stopContinuousSensingWithAllRegisteredSensors()
        
        if self.sensingKit.isSensorAvailable(SKSensorType.DeviceMotion) {
            
            try? self.sensingKit.register(SKSensorType.DeviceMotion)
            try? self.sensingKit.subscribe(to: SKSensorType.DeviceMotion, withHandler: { (sensorType, sensorData, error) in
                
                if let sensorData = sensorData as? SKDeviceMotion {
                    print("DeviceMotion: \(sensorData)")
                }
                try? self.sensingKit.deregister(SKSensorType.DeviceMotion)
            })
            
            try? self.sensingKit.startContinuousSensing(with: SKSensorType.DeviceMotion)
            
        }
    }
    
    private func getGyroscope() {
        try? self.sensingKit.stopContinuousSensingWithAllRegisteredSensors()
        
        if self.sensingKit.isSensorAvailable(SKSensorType.Gyroscope) {
            
            try? self.sensingKit.register(SKSensorType.Gyroscope)
            try? self.sensingKit.subscribe(to: SKSensorType.Gyroscope, withHandler: { (sensorType, sensorData, error) in
                
                if let sensorData = sensorData as? SKGyroscopeData {
                    print("Gyroscope: \(sensorData)")
                }
                try? self.sensingKit.deregister(SKSensorType.Gyroscope)
            })
            
            try? self.sensingKit.startContinuousSensing(with: SKSensorType.Gyroscope)
            
        }
    }
    
    private func getHeading() {
        try? self.sensingKit.stopContinuousSensingWithAllRegisteredSensors()
        
        if self.sensingKit.isSensorAvailable(SKSensorType.Heading) {
            
            try? self.sensingKit.register(SKSensorType.Heading)
            try? self.sensingKit.subscribe(to: SKSensorType.Heading, withHandler: { (sensorType, sensorData, error) in
                
                if let sensorData = sensorData as? SKHeadingData {
                    print("Heading: \(sensorData)")
                }
                try? self.sensingKit.deregister(SKSensorType.Heading)
            })
            
            try? self.sensingKit.startContinuousSensing(with: SKSensorType.Heading)
            
        }
    }
    
    private func getMagnetometer() {
        try? self.sensingKit.stopContinuousSensingWithAllRegisteredSensors()
        
        if self.sensingKit.isSensorAvailable(SKSensorType.Heading) {
            
            try? self.sensingKit.register(SKSensorType.Magnetometer)
            try? self.sensingKit.subscribe(to: SKSensorType.Magnetometer, withHandler: { (sensorType, sensorData, error) in
                
                if let sensorData = sensorData as? SKMagnetometerData {
                    print("Magnetometer: \(sensorData)")
                }
                try? self.sensingKit.deregister(SKSensorType.Magnetometer)
            })
            
            try? self.sensingKit.startContinuousSensing(with: SKSensorType.Magnetometer)
            
        }
    }
    
    private func getMotionActivity() {
        try? self.sensingKit.stopContinuousSensingWithAllRegisteredSensors()
        
        if self.sensingKit.isSensorAvailable(SKSensorType.MotionActivity) {
            
            try? self.sensingKit.register(SKSensorType.MotionActivity)
            try? self.sensingKit.subscribe(to: SKSensorType.MotionActivity, withHandler: { (sensorType, sensorData, error) in
                
                if let sensorData = sensorData as? SKMotionActivityData {
                    print("MotionActivity: \(sensorData)")
                }
                try? self.sensingKit.deregister(SKSensorType.MotionActivity)
            })
            
            try? self.sensingKit.startContinuousSensing(with: SKSensorType.MotionActivity)
            
        }
    }
    
    private func getPedometer() {
        try? self.sensingKit.stopContinuousSensingWithAllRegisteredSensors()
        
        if self.sensingKit.isSensorAvailable(SKSensorType.Pedometer) {
            
            try? self.sensingKit.register(SKSensorType.Pedometer)
            try? self.sensingKit.subscribe(to: SKSensorType.Pedometer, withHandler: { (sensorType, sensorData, error) in
                
                if let sensorData = sensorData as? SKPedometerData {
                    print("Pedometer: \(sensorData)")
                }
                try? self.sensingKit.deregister(SKSensorType.Pedometer)
            })
            
            try? self.sensingKit.startContinuousSensing(with: SKSensorType.Pedometer)
            
        }
    }
    
    // MARK: - Action methods
    @IBAction func accelerometerButtonDidClicked(_ sender: Any) {
        self.getAccelerometer()
    }
    
    @IBAction func gyroscopeButtonDidClicked(_ sender: Any) {
        self.getGyroscope()
    }
    
    @IBAction func magnetometerButtonDidClicked(_ sender: Any) {
        self.getMagnetometer()
    }
    
    @IBAction func deviceMotionButtonDidClicked(_ sender: Any) {
        self.getDeviceMotion()
    }
    
    @IBAction func motionActivityButtonButtonDidClicked(_ sender: Any) {
        self.getMotionActivity()
    }
    
    @IBAction func pedometerButtonDidClicked(_ sender: Any) {
        self.getPedometer()
    }
    
    @IBAction func altimeterButtonDidClicked(_ sender: Any) {
        self.getAltimeter()
    }
    
    @IBAction func headingButtonDidClicked(_ sender: Any) {
        self.getHeading()
    }
}
