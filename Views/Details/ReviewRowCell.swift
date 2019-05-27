//
//  ReviewContainer.swift
//  AppStoreJSONApis
//
//  Created by Mao Li on 4/23/19.
//  Copyright © 2019 MaoLi. All rights reserved.
//

import UIKit

class ReviewRowCell: UICollectionViewCell {
    let reviewLabel = UILabel(text: "Reviews & Ratings", font: .boldSystemFont(ofSize: 25))
    let reviewController = ReviewController()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(reviewController.view)
        addSubview(reviewLabel)
        reviewController.view.translatesAutoresizingMaskIntoConstraints = false
        reviewLabel.translatesAutoresizingMaskIntoConstraints = false
        reviewLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        reviewLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        reviewController.view.topAnchor.constraint(equalTo: reviewLabel.bottomAnchor, constant: 16).isActive = true
        reviewController.view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        reviewController.view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        reviewController.view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
