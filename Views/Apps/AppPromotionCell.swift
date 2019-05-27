//
//  AppPromotionCell.swift
//  AppStoreJSONApis
//
//  Created by Mao Li on 4/13/19.
//  Copyright © 2019 MaoLi. All rights reserved.
//

import UIKit

class AppPromotionCell: UICollectionViewCell {
 
    let smallLabel: UILabel = {
        let label = UILabel()
        label.text = "Facebook"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .blue
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 24)
        label.text = "ASDAS ASDA SDA SD ASD ASDADAS ASDAS"
        return label
    }()
    
    let promotionImage: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        return iv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        let stackView = UIStackView(arrangedSubviews: [
            smallLabel, titleLabel, promotionImage
            ])
        stackView.spacing = 12
        stackView.axis = .vertical
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
