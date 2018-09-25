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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSetUp()
        
    }
    
    // MARK: Set up
    func collectionViewSetUp() {
        let nib = UINib(nibName: "OpeningViewCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
    }
}

    // MARK: CollectionView Extension
extension OpeningView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = view.bounds.size.height
        let width = view.bounds.size.width
        
        return CGSize (width: width - 20, height: height - 500)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! OpeningViewCollectionViewCell
        
        return cell
    }
}
