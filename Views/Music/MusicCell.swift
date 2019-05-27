//
//  MusicCell.swift
//  AppStoreJSONApis
//
//  Created by Mao Li on 4/25/19.
//  Copyright © 2019 MaoLi. All rights reserved.
//

import UIKit

class MusicCell: UICollectionViewCell {
    
    let appIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        return iv
    }()
    
    let trackLabel: UILabel = {
        let label = UILabel()
        label.text = "Track Name"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Subtitle name"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let verticalStackView = UIStackView(arrangedSubviews: [
            trackLabel, subtitleLabel
            ])
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 4
        
        let stackView = UIStackView(arrangedSubviews: [
            appIconImageView, verticalStackView
            ])
        stackView.spacing = 20
        stackView.alignment = .center
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
