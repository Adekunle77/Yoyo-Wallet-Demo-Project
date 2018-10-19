//
//  AlertView.swift
//  MilkyWayDemoProject
//
//  Created by Ade Adegoke on 27/09/2018.
//  Copyright © 2018 AKA. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentAlert(title: String, message: String) {
        let title = title
        let message = message
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        self.present(alertController, animated: true, completion: nil)
        
        let defaultAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
    }
}
