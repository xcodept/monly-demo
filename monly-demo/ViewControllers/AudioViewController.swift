//
//  AudioViewController.swift
//  monly-demo
//
//  Created by studium on 09.06.19.
//  Copyright © 2019 codefuse. All rights reserved.
//

import UIKit
import AVFoundation

class AudioViewController: UIViewController {

    // MARK: - Properties
    private var audioPlayer: AVAudioPlayer?
    
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
    
    // MARK: - Methods
    private func playWav() {
        if let fileURL = Bundle.main.path(forResource: "audio-demo-wav", ofType: "wav") {
            self.audioPlayer = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL))
            self.audioPlayer?.play()
        } else {
            print("No file with specified name exists")
        }
    }
    
    private func playMp3() {
        if let fileURL = Bundle.main.path(forResource: "audio-demo-mp", ofType: "mp3") {
            self.audioPlayer = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL))
            self.audioPlayer?.play()
        } else {
            print("No file with specified name exists")
        }
    }
    
    // MARK: - Action methods
    @IBAction func wavButtonDidClicked(_ sender: Any) {
        self.playWav()
    }
    
    @IBAction func mp3ButtonDidClicked(_ sender: Any) {
        self.playMp3()
    }
    

}
