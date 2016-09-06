//
//  ViewController.swift
//  youtube
//
//  Created by Bijan Oviedo on 9/6/16.
//  Copyright © 2016 Bijan Oviedo. All rights reserved.
//

import UIKit

class HomeVC: UICollectionViewController {

    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent = false
        
        setupTitleLabel()
        setupCollectionView()
        
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        
        
    }
    
    func setupTitleLabel() {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "  Home"
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        
        navigationItem.titleView = titleLabel
    }
    
    func setupCollectionView() {
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
        }
    }
    
    
    




}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 50)
    }
}
