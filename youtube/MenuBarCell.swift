//
//  MenuBarCell.swift
//  youtube
//
//  Created by Bijan Oviedo on 9/6/16.
//  Copyright © 2016 Bijan Oviedo. All rights reserved.
//

import UIKit

class MenuBarCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "home")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = Constants.notHighlightedColor
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupImageView()
    }
    
    private func setupImageView() {
        addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.heightAnchor.constraint(equalToConstant: 28).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 28).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }

    override var isSelected: Bool {
        didSet {
            imageView.tintColor = isSelected ? .white : Constants.isHighlightedColor
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
