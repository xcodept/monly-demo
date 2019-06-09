//
//  TouchIdViewController.swift
//  monly-demo
//
//  Created by studium on 09.06.19.
//  Copyright © 2019 codefuse. All rights reserved.
//

import UIKit
import LocalAuthentication

class TouchIdViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - Outlets
    @IBOutlet weak var touchIdButton: UIButton! {
        didSet {
            self.touchIdButton.setTitle("Use Touch-ID", for: .normal)
        }
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Touch-ID"
    }
    
    // MARK: - Touch-ID methods
    private func authenticateUser() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identify yourself!"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                [unowned self] success, authenticationError in
                
                DispatchQueue.main.async {
                    if success {
                        let ac = UIAlertController(title: "Authentication successful", message: "Success", preferredStyle: .alert)
                        ac.addAction(UIAlertAction(title: "OK", style: .default))
                        self.present(ac, animated: true)
                    } else {
                        let ac = UIAlertController(title: "Authentication failed", message: "Error", preferredStyle: .alert)
                        ac.addAction(UIAlertAction(title: "OK", style: .default))
                        self.present(ac, animated: true)
                    }
                }
            }
        } else {
            let ac = UIAlertController(title: "Touch ID not available", message: "Your device is not configured for Touch ID.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    // MARK: - Action methods
    @IBAction func touchIdButtonDidClicked(_ sender: Any) {
        self.authenticateUser()
    }
}
