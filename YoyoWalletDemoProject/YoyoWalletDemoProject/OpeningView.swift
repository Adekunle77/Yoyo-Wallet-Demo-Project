//
//  OpeningView.swift
//  YoyoWalletDemoProject
//
//  Created by Ade Adegoke on 25/09/2018.
//  Copyright © 2018 AKA. All rights reserved.
//

import UIKit

class OpeningView: UIViewController {
    
    // MARK: Properties
    @IBOutlet private weak var collectionView: UICollectionView!
    fileprivate var reuseIdentifier = "cell"
    private var viewModel: OpeningViewViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSetUp()
        viewModelSetUp()
        
    }
    
    // MARK: SetUp
    func viewModelSetUp() {
        let dataSource = APIManager()
        viewModel = OpeningViewViewModel(dataSource: dataSource)
        viewModel.delegate = self
        viewModel.fatchMilkyWayData()
    }
    
    func collectionViewSetUp() {
        let nib = UINib(nibName: "OpeningViewCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
    }
}

    // MARK: OpeningView 
extension OpeningView: ViewModelDelegate {
    func modelDidUpdateData() {
        self.collectionView.reloadData()
    }
    
    func modelDidUpdateWithError(error: Error) {
        print("Error")
    }
    
    
}


    // MARK: CollectionView Extension
extension OpeningView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.arrayOfMilkyWayInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = view.bounds.size.height
        let width = view.bounds.size.width
        
        return CGSize (width: width - 20, height: height - 500)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! OpeningViewCollectionViewCell

        let updateCell = updateCells(with: indexPath)
        cell.updateCell(with: updateCell)
        
        let updateCellBackgdImage = updateCellsBacKGdImage(with: indexPath)
        print(updateCellBackgdImage.href)
        cell.updateCellBackgdImage(with: updateCellBackgdImage)
        

        return cell
    }
    
    func updateCells(with: IndexPath) -> MilkyWayInfo {
        let milkyWayInfoFromAPI = viewModel.arrayOfMilkyWayInfo[with.item]
        let milkyWayInfos = milkyWayInfoFromAPI.data
        let milkywayInfo = milkyWayInfos[0]
        return milkywayInfo
    }
    
    func updateCellsBacKGdImage(with: IndexPath) -> Links {
        let milkyWayImageFromAPI = viewModel.arrayOfMilkyWayInfo[with.item]
        let milkyWayImage = milkyWayImageFromAPI.links
        
        return milkyWayImage[0]
    }
}
