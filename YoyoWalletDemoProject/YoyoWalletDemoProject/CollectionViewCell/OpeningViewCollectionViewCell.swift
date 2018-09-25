//
//  OpeningViewCollectionViewCell.swift
//  YoyoWalletDemoProject
//
//  Created by Ade Adegoke on 25/09/2018.
//  Copyright © 2018 AKA. All rights reserved.
//

import UIKit

class OpeningViewCollectionViewCell: UICollectionViewCell {

    // MARK: Properties
    @IBOutlet private weak var backgdImage: UIImageView!
    @IBOutlet private weak var centreName: UILabel!
    @IBOutlet weak var launchDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}

