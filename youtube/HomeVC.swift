//
//  ViewController.swift
//  youtube
//
//  Created by Bijan Oviedo on 9/6/16.
//  Copyright © 2016 Bijan Oviedo. All rights reserved.
//

import UIKit

class HomeVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    private let cellId = "cellId"
    
    private let titles = ["Home", "Trending", "Subscriptions", "Account"]
    
    lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.homeController = self
        
        return mb
    }()
    
    // MARK: Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.hidesBarsOnSwipe = true
        
        setupTitleLabel()
        setupCollectionView()
        setupNavBarButtons()
        setupMenuBar()
    }
    
    // MARK: Setting up views
    
    private func setupTitleLabel() {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "  Home"
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.textColor = .white
        
        navigationItem.titleView = titleLabel
    }
    
    private func setupCollectionView() {
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
        
        collectionView?.backgroundColor = .white
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView?.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView?.isPagingEnabled = true
    }
    
    private func setupNavBarButtons() {
        let searchImage = UIImage(named: "search")?.withRenderingMode(.alwaysOriginal)
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        
        let moreImage = UIImage(named: "more")?.withRenderingMode(.alwaysOriginal)
        let moreBarButtonItem = UIBarButtonItem(image: moreImage, style: .plain, target: self, action: #selector(handleMore))
        
        navigationItem.rightBarButtonItems = [searchBarButtonItem,moreBarButtonItem]
    }
    
    private func setupMenuBar() {

        menuBar.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(menuBar)
        
        
        menuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        menuBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        menuBar.heightAnchor.constraint(equalToConstant: 50).isActive = true

    }
    
    private func setTitle(for indexPath: IndexPath) {
        if let titleLabel = navigationItem.titleView as? UILabel {
            titleLabel.text = "  \(titles[indexPath.item])"
        }
    }
    
    // MARK: Handling Navigation Bar Buttons
    
    func handleSearch() {
        print("Handling search...")
    }
    
    func handleMore() {
        print("Handling more...")
    }
    
    
    // MARK: Scrolling Functions
    
    func scroll(to menuIndexPath: IndexPath) {
        collectionView?.scrollToItem(at: menuIndexPath, at: [], animated: true)
        setTitle(for: menuIndexPath)
    }
    
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.horizontalBarLeadingAnchor?.constant = scrollView.contentOffset.x / 4
    }

    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let itemIndex = targetContentOffset.pointee.x / view.frame.width
        let targetIndexPath = IndexPath(item: Int(itemIndex), section: 0)
        menuBar.collectionView.selectItem(at: targetIndexPath, animated: true, scrollPosition: [])
        setTitle(for: targetIndexPath)
    }
    
    // MARK: CollectionView Data Source
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        let colors: [UIColor] = [.red,.blue,.green,.yellow]
        
        cell.backgroundColor = colors[indexPath.item]
        return cell
    }
    
    // MARK: CollectionView Delegate
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 50)
    }
    
    


}
