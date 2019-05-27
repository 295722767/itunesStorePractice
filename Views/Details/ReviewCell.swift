//
//  ReviewCell.swift
//  AppStoreJSONApis
//
//  Created by Mao Li on 4/23/19.
//  Copyright © 2019 MaoLi. All rights reserved.
//

import UIKit

class ReviewCell: UICollectionViewCell {

    
    let titleLabel = UILabel(text: "Title", font: .boldSystemFont(ofSize: 18))
    let nameLabel = UILabel(text: "Name", font: .systemFont(ofSize: 16))
    let starStackView: UIStackView = {
        var arrangedSubviews = [UIView]()
        (0..<5).forEach({ (_) in
            let imageView = UIImageView(image: #imageLiteral(resourceName: "xingxing"))
            imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
            arrangedSubviews.append(imageView)
        })
        arrangedSubviews.append(UIView())
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        return stackView
    }()
    let contentLabel = UILabel(text: "asdasd\nasda\nasda", font: .systemFont(ofSize: 16), numberOfLines: 5)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.9118879437, green: 0.9120408893, blue: 0.9118677974, alpha: 1)
        nameLabel.textColor = .gray
        nameLabel.textAlignment = .right
        self.layer.cornerRadius = 12
        clipsToBounds = true
        let horizontalView = UIStackView(arrangedSubviews: [
            titleLabel, nameLabel
            ])
        horizontalView.spacing = 8
        titleLabel.setContentCompressionResistancePriority(.init(0), for: .horizontal)
        let stackView = UIStackView(arrangedSubviews: [
            horizontalView, starStackView, contentLabel
            ])
        stackView.axis = .vertical
        stackView.spacing = 12
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
