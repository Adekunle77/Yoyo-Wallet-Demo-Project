//
//  Results.swift
//  YoyoWalletDemoProject
//
//  Created by Ade Adegoke on 25/09/2018.
//  Copyright © 2018 AKA. All rights reserved.
//

import Foundation

enum Results<DataType, ErrorType: Error> {
    case success(DataType)
    case failure(ErrorType)
    
}
