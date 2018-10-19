//
//  DataSource.swift
//  MilkyWayDemoProject
//
//  Created by Ade Adegoke on 25/09/2018.
//  Copyright © 2018 AKA. All rights reserved.
//

import Foundation

typealias DataSourceCompletionHandler = (_ results: Results<[MilkyWayData], DataSourceError>) -> Void

enum DataSourceError: Error {
    case fatel(String)
    case network(Error)
    case noData
    case dataError(Error)
    case jsonParseError(Error)
 
}

protocol API {
    func fetchMilkyWayData(completion: @escaping DataSourceCompletionHandler)
    
}
