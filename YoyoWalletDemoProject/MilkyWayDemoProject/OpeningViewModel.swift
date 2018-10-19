//
//  OpeningViewModel.swift
//  MilkyWayDemoProject
//
//  Created by Ade Adegoke on 25/09/2018.
//  Copyright © 2018 AKA. All rights reserved.
//

import Foundation

protocol ViewModelDelegate: class {
    func modelDidUpdateData()
    func modelDidUpdateWithError(error: Error)
}

class MilkyWayObsevers: NSObject {
    @objc dynamic var title = String()
    @objc dynamic var backgroundImage = String()
    @objc dynamic var centreName = String()
    @objc dynamic var launchDate = String()
    
}

class OpeningViewViewModel {
    
    // MARK: Properties
    var arrayOfMilkyWayInfo = [MilkyWayData]()
    
    @objc var milkyWayArray = MilkyWayObsevers()
    
    weak var delegate: ViewModelDelegate?
    let dataSource: API
    
    // MARK: Methods
    init(dataSource: API) {
        self.dataSource = dataSource
    }
    
    func obseversData(array: [MilkyWayData]) {

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
                    self?.milkyWayArray.title = milkyWayData[0].data[0].title

            }
        }
    }

}
