//
//  OpeningView.swift
//  MilkyWayDemoProject
//
//  Created by Ade Adegoke on 25/09/2018.
//  Copyright © 2018 AKA. All rights reserved.
//

import UIKit

final class OpeningViewController: UIViewController {
    
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
        viewModel.fetchMilkyWayData()
    }
    
    func collectionViewSetUp() {
        let nib = UINib(nibName: "OpeningViewCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
//        self.navigationController?.navigationBar.alpha = 0
    }
}

    // MARK: OpeningView 
extension OpeningViewController: ViewModelDelegate {
    func modelDidUpdateData() {
        self.collectionView.reloadData()
    }
    
    func modelDidUpdateWithError(error: Error) {
        let errorMessage = error.localizedDescription
        presentAlert(title: "Sorry There is a Network Error!", message: errorMessage)
    }
    
    
}

    // MARK: CollectionView Extension
extension OpeningViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
        cell.updateCellBackgdImage(with: updateCellBackgdImage)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let milkyWay = viewModel.arrayOfMilkyWayInfo[indexPath.item]
       
        presentDetailView(withID: milkyWay)
    }
    
    func presentDetailView(withID: MilkyWayData) {
        
        self.performSegue(withIdentifier: "detailViewSegue", sender: withID)
    }
    
    func updateCells(with: IndexPath) -> MilkyWayInfo {
        let milkyWayInfoFromAPI = viewModel.arrayOfMilkyWayInfo[with.item]
        let milkyWayInfos = milkyWayInfoFromAPI.data
        let milkyWayInfo = milkyWayInfos[0]
        return milkyWayInfo
    }
    
    func updateCellsBacKGdImage(with: IndexPath) -> Links {
        let milkyWayImageFromAPI = viewModel.arrayOfMilkyWayInfo[with.item]
        let milkyWayImage = milkyWayImageFromAPI.links
        
        return milkyWayImage[0]
    }
}

//MARK: Extension for seague

extension OpeningViewController {
    override func prepare(for segue: UIStoryboardSegue, sender anyObject: Any?) {
        if let milkyWayDetails = segue.destination as? DetailViewController,
            let milkyWayID = anyObject as? MilkyWayData {
            milkyWayDetails.milkyWay = milkyWayID
        }
    }
}

