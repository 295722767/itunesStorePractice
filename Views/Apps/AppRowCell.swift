//
//  AppRowCell.swift
//  AppStoreJSONApis
//
//  Created by Mao Li on 4/13/19.
//  Copyright © 2019 MaoLi. All rights reserved.
//

import UIKit

class AppRowCell: UICollectionViewCell {
    
    let appIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        return iv
    }()
    
    let nameLabel = UILabel(text: "APP name", font: UIFont.systemFont(ofSize: 16))
    let companyLabel = UILabel(text: "company name", font: UIFont.systemFont(ofSize: 13))
    
    let getButton: UIButton = {
        let button = UIButton()
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.layer.cornerRadius = 16
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        companyLabel.textColor = .darkGray
        
        let labelStackView = UIStackView(arrangedSubviews: [
            nameLabel, companyLabel
            ])
        labelStackView.axis = .vertical
        labelStackView.spacing = 4
        
        let stackView = UIStackView(arrangedSubviews: [
            appIconImageView, labelStackView, getButton
            ])
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.alignment = .center
        stackView.spacing = 12
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
