//
//  PreviewCell.swift
//  AppStoreJSONApis
//
//  Created by Mao Li on 4/23/19.
//  Copyright © 2019 MaoLi. All rights reserved.
//

import UIKit

class PreviewCell: UICollectionViewCell {
    
    let previewLabel = UILabel(text: "Preview", font: .boldSystemFont(ofSize: 25))
    let previewController = PreviewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        let stackView = UIStackView(arrangedSubviews: [
            previewLabel, previewController.view
            ])
        stackView.axis = .vertical
        stackView.spacing = 12
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
