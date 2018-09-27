//
//  OpeningViewModel.swift
//  YoyoWalletDemoProject
//
//  Created by Ade Adegoke on 25/09/2018.
//  Copyright © 2018 AKA. All rights reserved.
//

import Foundation

protocol ViewModelDelegate: class {
    func modelDidUpdateData()
    func modelDidUpdateWithError(error: Error)
}

class OpeningViewViewModel {
    
    // MARK: Properties
    var arrayOfMilkyWayInfo = [MilkyWayData]()
    
    weak var delegate: ViewModelDelegate?
    let dataSource: API
    
    // MARK: Methods
    init(dataSource: API) {
        self.dataSource = dataSource
    }
    
    func fetchMilkyWayData() {
        
        dataSource.fetchMilkyWayData {[weak self] (result) in
            switch result {
                case .failure(let error):
                    self?.delegate?.modelDidUpdateWithError(error: error)
                    return
                case .success(let milkyWayData):
                    self?.arrayOfMilkyWayInfo = milkyWayData
                    self?.delegate?.modelDidUpdateData()
            }
        }
    }
    
}
