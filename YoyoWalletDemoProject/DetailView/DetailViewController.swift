//
//  DetailViewController.swift
//  YoyoWalletDemoProject
//
//  Created by Ade Adegoke on 26/09/2018.
//  Copyright © 2018 AKA. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var milkyWayImage: UIImageView!
    @IBOutlet weak var milkyWayTitle: UILabel!
    @IBOutlet weak var dateCreated: UILabel!
    @IBOutlet weak var center: UILabel!
    @IBOutlet weak var backBTN: UIButton!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var milkyWay: MilkyWayData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailViewPropertiesSetup()
        updateMilkyWayImage()
    }

    //MARK: SetUp
    func detailViewPropertiesSetup() {
        guard let infoForProperties = milkyWay?.data[0] else {
            return
        }
        
        milkyWayTitle.text = infoForProperties.title
        center.text = infoForProperties.center
        let date = String(infoForProperties.date_created.prefix(10))
        dateCreated.text = date
        descriptionTextView.text = infoForProperties.description
    }
    
    
    @IBAction func didTapBack(_ sender: Any) {
        performSegue(withIdentifier: "openingViewSegue", sender: nil)
    }
    
    // downloading image 
    func updateMilkyWayImage() {
        guard let imageURL = milkyWay?.links[0].href else {
            return
        }
        milkyWayImage.downloadImage(from: imageURL)
    }
}
