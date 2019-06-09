//
//  MenuItemTableViewCell.swift
//  monly-demo
//
//  Created by studium on 08.06.19.
//  Copyright © 2019 codefuse. All rights reserved.
//

import UIKit
import Reusable

class MenuItemTableViewCell: UITableViewCell, NibReusable {

    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    // MARK: - Properties
    internal var model: MenuItem? {
        didSet {
            guard let model = model else { return }
            self.titleLabel.text = model.title
            self.iconImageView.image = model.image
        }
    }
    
}
