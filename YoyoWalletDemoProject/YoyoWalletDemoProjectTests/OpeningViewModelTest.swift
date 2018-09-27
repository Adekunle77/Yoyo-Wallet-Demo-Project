//
//  OpeningViewModelTest.swift
//  YoyoWalletDemoProjectTests
//
//  Created by Ade Adegoke on 27/09/2018.
//  Copyright © 2018 AKA. All rights reserved.
//

import XCTest
@testable import YoyoWalletDemoProject

class OpeningViewModelTest: XCTestCase {
    
    class ViewModelDelegateSpy: ViewModelDelegate {
        
        var spy_modelDidUpdateData = false
        var spy_modelDidUpdateWithError: Error?
        var spy_showMilkyWayDetails: MilkyWayData?
        
        func modelDidUpdateData() {
            spy_modelDidUpdateData = true
        }
        
        func modelDidUpdateWithError(error: Error) {
            spy_modelDidUpdateWithError = error
        }
        
        func showMilkyWayDetails(milkyWay: MilkyWayData) {
            spy_showMilkyWayDetails = milkyWay
        }
        
    }
    
    var mockAPI = MockAPI()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testfetchMilkyWayData_API_returns_error() {
        //setup
        mockAPI.isReturningError = true
        let spy = ViewModelDelegateSpy()
        let viewModel = OpeningViewViewModel(dataSource: mockAPI)
        viewModel.delegate = spy
        
        //excute
        viewModel.fetchMilkyWayData()
        
        //test
        XCTAssertFalse(spy.spy_modelDidUpdateData)
        XCTAssertNotNil(spy.modelDidUpdateWithError)
    }
    
    func testfetchMilkyWayData_API_returns_success() {
        //setup
        mockAPI.isReturningError = false
        let spy = ViewModelDelegateSpy()
        let viewModel = OpeningViewViewModel(dataSource: mockAPI)
        viewModel.delegate = spy
        
        //excute
        viewModel.fetchMilkyWayData()
        
        //test
        XCTAssertTrue(spy.spy_modelDidUpdateData)
        XCTAssertNil(spy.modelDidUpdateWithError)
    }
    
    
}
