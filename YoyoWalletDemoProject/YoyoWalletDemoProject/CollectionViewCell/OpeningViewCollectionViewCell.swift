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
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var backgdImage: UIImageView!
    @IBOutlet private weak var centreName: UILabel!
    @IBOutlet weak var launchDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: Methods
    func updateCell(with milkyWaydataFrom: MilkyWayInfo) {
        centreName.text = milkyWaydataFrom.center
        launchDate.text = milkyWaydataFrom.date_created
        title.text = milkyWaydataFrom.title
    }
    
    func updateCellBackgdImage(with imageURL: Links) {
        let url = imageURL.href
        backgdImage.downloadImage(from: url) 
    }
}
