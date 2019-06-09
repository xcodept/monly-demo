//
//  MicrophoneViewController.swift
//  monly-demo
//
//  Created by studium on 09.06.19.
//  Copyright © 2019 codefuse. All rights reserved.
//

import UIKit
import SensingKit

class MicrophoneViewController: UIViewController {

    // MARK: - Properties
    private let sensingKit = SensingKitLib.shared()
    
    // MARK: - Outlets
    @IBOutlet weak var microphoneButton: UIButton! {
        didSet {
            self.microphoneButton.setTitle("Use Microphone", for: .normal)
        }
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Microphone"
    }
    
    // MARK: - Methods
    private func startMicrophone() {
        try? self.sensingKit.stopContinuousSensingWithAllRegisteredSensors()
        
        if self.sensingKit.isSensorAvailable(SKSensorType.Microphone) {
            
            try? self.sensingKit.register(SKSensorType.Microphone)
            try? self.sensingKit.subscribe(to: SKSensorType.Microphone, withHandler: { (sensorType, sensorData, error) in
                
                if let sensorData = sensorData as? SKMicrophoneData {
                    print("microphone: \(sensorData)")
                }
                try? self.sensingKit.deregister(SKSensorType.Microphone)
            })
            
            try? self.sensingKit.startContinuousSensing(with: SKSensorType.Microphone)
            
        }
    }

    // MARK: - Action methods
    @IBAction func microphoneButtonDidClicked(_ sender: Any) {
        self.startMicrophone()
    }

}
