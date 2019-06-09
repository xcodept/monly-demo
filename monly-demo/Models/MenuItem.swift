//
//  MenuItem.swift
//  monly-demo
//
//  Created by studium on 08.06.19.
//  Copyright © 2019 codefuse. All rights reserved.
//

import UIKit

struct MenuItem {
    let title: String
    let image: UIImage
    let visible: Bool
    let segue: StoryboardSegue.Main
    
    init(title: String, image: UIImage, segue: StoryboardSegue.Main) {
        self.title = title
        self.image = image
        self.visible = true
        self.segue = segue
    }
}
