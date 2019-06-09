//
//  MenuViewController.swift
//  monly-demo
//
//  Created by studium on 08.06.19.
//  Copyright © 2019 codefuse. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    // MARK: - Lazy
    private lazy var dataSource: SideMenuDataSource = {
        
        return SideMenuDataSource(didSelectHandler: { [weak self] (item) in
                print("item: \(item)")
                self?.perform(segue: item.segue)
            }, updateUIHandler: { [weak self] (_, _) in
                self?.tableView.reloadData()
        })
    }()
    
    private lazy var menuItems: [MenuItem] = {
        
        return [
            MenuItem(title: "Camera", image: Asset._008PopUp.image, segue: StoryboardSegue.Main.showCameraViewController),
            MenuItem(title: "GPS", image: Asset._003Map.image, segue: StoryboardSegue.Main.showGPSViewController),
            MenuItem(title: "Microphone", image: Asset._009Karaoke.image, segue: StoryboardSegue.Main.showMicrophoneViewController),
            MenuItem(title: "Audio", image: Asset._010Loudspeaker.image, segue: StoryboardSegue.Main.showAudioViewController),
            MenuItem(title: "Bluetooth", image: Asset._014Bluetooth.image, segue: StoryboardSegue.Main.showBluetoothViewController),
            MenuItem(title: "Wifi", image: Asset._007Router.image, segue: StoryboardSegue.Main.showWifiViewController),
            MenuItem(title: "Network Traffic", image: Asset._013Mobile.image, segue: StoryboardSegue.Main.showNetworkTrafficViewController),
            MenuItem(title: "Sensors", image: Asset._004Sensors.image, segue: StoryboardSegue.Main.showSensorsViewController),
            MenuItem(title: "GSM", image: Asset._006Airdrop.image, segue: StoryboardSegue.Main.showGSMViewController),
            MenuItem(title: "Gallery", image: Asset._15Image.image, segue: StoryboardSegue.Main.showGalleryViewController),
            MenuItem(title: "3D-Touch", image: Asset._001Fingerprint.image, segue: StoryboardSegue.Main.showTouchViewController),
            MenuItem(title: "Face-ID", image: Asset._002Face.image, segue: StoryboardSegue.Main.showFaceIdViewController)
        ]
    }()
    
    // MARK: - Properties
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            let sortedMenuItems = self.menuItems.sorted { (item_1, item_2) -> Bool in
                item_1.title < item_2.title
            }
            self.dataSource.set(dataSource: sortedMenuItems)
            self.dataSource.configure(tableView: self.tableView)
        }
    }

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
