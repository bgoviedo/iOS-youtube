//
//  MenuBar.swift
//  youtube
//
//  Created by Bijan Oviedo on 9/6/16.
//  Copyright © 2016 Bijan Oviedo. All rights reserved.
//

import UIKit

//class MenuBar: UIView {
//    
//    lazy var collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cv.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
//        cv.dataSource = self
//        cv.delegate = self
//        return cv
//    }()
//    
//    let cellId = "cellId"
//    let imageNames = ["home", "trending", "subscriptions", "account"]
//    
//    var homeController: HomeVC?
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
//        
//        addSubview(collectionView)
//
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        
//        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
//        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        
//        let selectedIndexPath = IndexPath(item: 0, section: 0)
//
//        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: [])
//        
//        setupHorizontalBar()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    var horizontalBarLeftAnchorConstraint: NSLayoutConstraint?
//    
//    func setupHorizontalBar() {
//        let horizontalBarView = UIView()
//        horizontalBarView.backgroundColor = UIColor(white: 0.95, alpha: 1)
//        horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
//        addSubview(horizontalBarView)
//        
//        horizontalBarLeftAnchorConstraint = horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
//        horizontalBarLeftAnchorConstraint?.isActive = true
//        
//        horizontalBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        horizontalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4).isActive = true
//        horizontalBarView.heightAnchor.constraint(equalToConstant: 4).isActive = true
//    }
//}
//
//extension MenuBar: UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        homeController?.scrollToMenuIndex(menuIndex: indexPath.item)
//    }
//    
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 4
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
//        
//        cell.imageView.image = UIImage(named: imageNames[indexPath.item])?.withRenderingMode(.alwaysTemplate)
//        cell.tintColor = UIColor.rgb(red: 91, green: 14, blue: 13)
//        
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: frame.width / 4, height: frame.height)
//        
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//    
//
//}
//
//
//class MenuCell: UICollectionViewCell {
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupViews()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    let imageView: UIImageView = {
//        let iv = UIImageView()
//        iv.image = UIImage(named: "home")?.withRenderingMode(.alwaysTemplate)
//        iv.tintColor = UIColor.rgb(red: 91, green: 14, blue: 13)
//        return iv
//    }()
//    
//    override var isHighlighted: Bool {
//        didSet {
//            imageView.tintColor = isHighlighted ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13)
//        }
//    }
//    
//    override var isSelected: Bool {
//        didSet {
//            imageView.tintColor = isSelected ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13)
//        }
//    }
//    
//     func setupViews() {
//        
//        addSubview(imageView)
//        addConstraints(with: "H:[v0(28)]", views: imageView)
//        addConstraints(with: "V:[v0(28)]", views: imageView)
//        
//        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
//        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
//    }
//    
//}


class MenuBar: UIView {
    
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let frame = self.frame
        let cv = UICollectionView(frame: frame, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "menuCellId")
        print("The frame is \(frame)")
        addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
extension MenuBar: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCellId", for: indexPath)
        
        let colors: [UIColor] = [.red,.blue,.green,.yellow]
        cell.backgroundColor = colors[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 4, height: frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
 
}







