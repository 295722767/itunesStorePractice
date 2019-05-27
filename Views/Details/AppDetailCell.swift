//
//  AppDetailCell.swift
//  AppStoreJSONApis
//
//  Created by Mao Li on 4/21/19.
//  Copyright © 2019 MaoLi. All rights reserved.
//

import UIKit

class AppDetailCell: UICollectionViewCell {
    
//    var app: Result! {
//        didSet {
//            nameLabel.text = app.trackName
//            releaseNotesLabel.text = app.releaseNotes
//            appIconImageView.sd_setImage(with: URL(string: app.artworkUrl100 ?? ""))
//            priceButton.setTitle(app.formattedPrice, for: .normal)
//        }
//    }
    
    let appIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 16
        iv.clipsToBounds = true
        iv.widthAnchor.constraint(equalToConstant: 140).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 140).isActive = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.numberOfLines = 2
        return label
    }()
    
    let priceButton: UIButton = {
        let button = UIButton()
        button.setTitle("$4.99", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.4681662934, blue: 0.9686274529, alpha: 1)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        return button
    }()
    
    //use label helper functions
    let whatsNewLabel = UILabel(text: "What's new", font: .boldSystemFont(ofSize: 16))
    let releaseNotesLabel = UILabel(text: "release notes", font: .systemFont(ofSize: 16), numberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        let infoStackView = UIStackView(arrangedSubviews: [
            nameLabel, UIStackView(arrangedSubviews: [priceButton, UIView()]), UIView()
            ])
        infoStackView.axis = .vertical
        infoStackView.spacing = 12
        let topStackView = UIStackView(arrangedSubviews: [
            appIconImageView, infoStackView
            ])
        topStackView.spacing = 12
        let finalStackView = UIStackView(arrangedSubviews: [
            topStackView, whatsNewLabel, releaseNotesLabel
            ])
        finalStackView.axis = .vertical
        finalStackView.spacing = 16
        
        addSubview(finalStackView)
        finalStackView.translatesAutoresizingMaskIntoConstraints = false
        finalStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        finalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        finalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
        finalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
