//
//  APIManager.swift
//  YoyoWalletDemoProject
//
//  Created by Ade Adegoke on 25/09/2018.
//  Copyright © 2018 AKA. All rights reserved.
//

import Foundation

class APIManager: API {
    
    private var nasaSearchURL = "https://images-api.nasa.gov/search?q=milky%20way&media_type=image&year_start=2017&year_end=2017"
    
    func fetchMilkyWayData(completion: @escaping DataSourceCompletionHandler) {
        
        guard let url = URL(string: nasaSearchURL) else {
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
                let milkyWayData = try JSONDecoder().decode(Collection.self, from: data)
                let milkyWayJSON = milkyWayData.collection.items
                DispatchQueue.main.async {
                    completion(Results.success(milkyWayJSON))
                }
            } catch {
                
            }
        }
        session.resume()
    }
 
}
