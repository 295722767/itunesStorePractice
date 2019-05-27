//
//  AppGroupCell.swift
//  AppStoreJSONApis
//
//  Created by Mao Li on 4/11/19.
//  Copyright © 2019 MaoLi. All rights reserved.
//

import UIKit

class AppsGroupCell: UICollectionViewCell {
    
    let titleLabel = UILabel(text: "App Section", font: .boldSystemFont(ofSize: 25))
    let horizontalController = HorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //self means current class which is AppsGroupCell
        
        self.backgroundColor = .white
        addSubview(titleLabel)
        addSubview(horizontalController.view)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive  = true
        
        horizontalController.view.translatesAutoresizingMaskIntoConstraints = false
        horizontalController.view.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        horizontalController.view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        horizontalController.view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        horizontalController.view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
