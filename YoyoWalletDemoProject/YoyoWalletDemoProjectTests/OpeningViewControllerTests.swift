//
//  OpeningViewControllerTests.swift
//  YoyoWalletDemoProjectTests
//
//  Created by Ade Adegoke on 27/09/2018.
//  Copyright © 2018 AKA. All rights reserved.
//

import XCTest
@testable import YoyoWalletDemoProject

class OpeningViewControllerTests: XCTestCase {
    
    var mockAPI = MockAPI()
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_collectionView_NumberOfCells() {
        //setup
        let vc = OpeningViewController()
        mockAPI.isReturningError = false
        let viewModel = OpeningViewViewModel(dataSource: mockAPI)
    
        //excute
        let results = vc.collectionView(UICollectionView(), numberOfItemsInSection: 0)
        
        //test
        
    }
    
}
