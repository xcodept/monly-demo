//
//  AudioViewController.swift
//  monly-demo
//
//  Created by studium on 09.06.19.
//  Copyright © 2019 codefuse. All rights reserved.
//

import UIKit

class AudioViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var wavButton: UIButton! {
        didSet {
            self.wavButton.setTitle("Play .wav", for: .normal)
        }
    }
    
    @IBOutlet weak var mp3Button: UIButton! {
        didSet {
            self.mp3Button.setTitle("Play .mp3", for: .normal)
        }
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Audio"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
