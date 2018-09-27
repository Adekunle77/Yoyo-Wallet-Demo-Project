//
//  MockAPI.swift
//  YoyoWalletDemoProjectTests
//
//  Created by Ade Adegoke on 27/09/2018.
//  Copyright © 2018 AKA. All rights reserved.
//

import Foundation
@testable import YoyoWalletDemoProject

class MockAPI: API {
    
    var isReturningError = false
    
    func fetchMilkyWayData(completion: @escaping DataSourceCompletionHandler) {
        
        if isReturningError {
            completion(Results.failure(DataSourceError.noData))
        } else {
            let data = MilkyWayInfo(title: "Title", nasa_id: "NASAid", center: "Centre", date_created: "Date created", description: "description")
            let links = Links(render: "Render", rel: "Rel", href: "Links Herf")
            let dataType = MilkyWayData(href: "Href", data: [data], links: [links])
            
            completion(Results.success([dataType]))
        }
    }
  
}
