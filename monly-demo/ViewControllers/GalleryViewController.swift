//
//  GalleryViewController.swift
//  monly-demo
//
//  Created by studium on 09.06.19.
//  Copyright © 2019 codefuse. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - Outlets
    @IBOutlet weak var cameraButton: UIButton! {
        didSet {
            self.cameraButton.setTitle("Open Camera", for: .normal)
        }
    }
    
    @IBOutlet weak var photoLibraryButton: UIButton! {
        didSet {
            self.photoLibraryButton.setTitle("Open Photo Library", for: .normal)
        }
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Gallery"
    }
    
    // MARK: - Methods
    private func camera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let myPickerController = UIImagePickerController()
//            myPickerController.delegate = self;
            myPickerController.sourceType = .camera
            self.present(myPickerController, animated: true, completion: nil)
        }
        
    }
    
    private func photoLibrary() {
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let myPickerController = UIImagePickerController()
//            myPickerController.delegate = self;
            myPickerController.sourceType = .photoLibrary
            self.present(myPickerController, animated: true, completion: nil)
        }
    }
    
    // MARK: - Action methods
    @IBAction func cameraButtonDidClicked(_ sender: Any) {
        self.camera()
    }
    
    @IBAction func photoLibraryButtonDidClicked(_ sender: Any) {
        self.photoLibrary()
    }
    
}
