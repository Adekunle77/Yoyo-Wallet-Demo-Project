//
//  MilkyWay.swift
//  YoyoWalletDemoProject
//
//  Created by Ade Adegoke on 25/09/2018.
//  Copyright © 2018 AKA. All rights reserved.
//

import Foundation

struct ResponseData: Decodable {
    var collection: Items
}

struct Items: Decodable {
    var items: [MilkyWayData]

}

struct MilkyWayData: Decodable {
    var href: String
    var data: [MilkyWayInfo]
    var links: [Links]
    
}

struct MilkyWayInfo: Decodable {
    var title: String
    var nasa_id: String
    var center: String
    var date_created: String
    var description: String
}

struct Links: Decodable {
    var render: String
    var rel: String
    var href: String
    
}
