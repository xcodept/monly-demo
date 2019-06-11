//
//  CameraViewController.swift
//  monly-demo
//
//  Created by studium on 09.06.19.
//  Copyright © 2019 codefuse. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {

    // MARK: - Properties
    let cameraController = CameraController()
    
    // MARK: - Outlets
    @IBOutlet fileprivate var capturePreviewView: UIView!
    @IBOutlet weak var refreshButton: BorderButton! {
        didSet {
            self.refreshButton.setTitle("Ok", for: .normal)
        }
    }
    @IBOutlet weak var segmentedControl1: UISegmentedControl!
    @IBOutlet weak var segmentedControl2: UISegmentedControl!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Camera"
        
        func configureCameraController() {
            self.cameraController.prepare {(error) in
                if let error = error {
                    print(error)
                }
                
                try? self.cameraController.displayPreview(on: self.capturePreviewView)
            }
        }
        
        configureCameraController()
    }
    
    // MARK: - Actions
    @IBAction func refreshButtonDidClicked(_ sender: Any) {
        
        switch self.segmentedControl1.selectedSegmentIndex {
        case 0:
            break
        default:
            break
        }
        
        //
        switch self.segmentedControl2.selectedSegmentIndex {
        case 0:
            try? self.cameraController.switchToFrontCamera()
        default:
            try? self.cameraController.switchToRearCamera()
        }
    }
}
