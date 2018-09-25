//
//  ImageExtension.swift
//  YoyoWalletDemoProject
//
//  Created by Ade Adegoke on 25/09/2018.
//  Copyright © 2018 AKA. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadImage2(from imageURL: String, completion: @escaping DataSourceCompletionHandler) {
        guard let url = URL(string: imageURL) else {
            return
        }
        let session = URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let error = error {
                DispatchQueue.main.async {
                    completion(Results.failure(DataSourceError.network(error)))
                }
            }
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(Results.failure(DataSourceError.noData))
                }
                return
            }
            do {
                let milkyWayData = try JSONDecoder().decode(ResponseData.self, from: data)
                let milkyWayParsed = milkyWayData.collection.items
                DispatchQueue.main.async {
                    completion(Results.success(milkyWayParsed))
                }
                
            } catch {
                DispatchQueue.main.async {
                    DispatchQueue.main.async {
                        completion(Results.failure(DataSourceError.dataError(error)))
                    }
                }
            }
        }
        session.resume()
    }
}
