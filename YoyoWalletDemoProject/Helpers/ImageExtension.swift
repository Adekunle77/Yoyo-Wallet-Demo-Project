//
//  ImageExtension.swift
//  YoyoWalletDemoProject
//
//  Created by Ade Adegoke on 26/09/2018.
//  Copyright © 2018 AKA. All rights reserved.
//

import Foundation

import UIKit

extension UIImageView {
    func downloadImage(from imageURL: String) {
        guard let url = URL(string: imageURL) else {
            return
        }
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else {
                return
                }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }
        session.resume()
    }
    
}
