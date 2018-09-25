//
//  MilkyWay.swift
//  YoyoWalletDemoProject
//
//  Created by Ade Adegoke on 25/09/2018.
//  Copyright © 2018 AKA. All rights reserved.
//

import Foundation

struct Collection: Decodable {
    var collection: Items
}

struct Items: Decodable {
    var items: [MilkyWay]
}
struct MilkyWay: Decodable {
    var href: String
    var data: [MilkyWay]
    var links: [Links]
}

struct MilkyWayData: Decodable {
    var title: String
    var centre: String
    var date_created: String
    
}

struct Links: Decodable {
    var render: String
    var rel: String
    var href: String
}
