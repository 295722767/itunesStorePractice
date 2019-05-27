//
//  MusicLoadFooter.swift
//  AppStoreJSONApis
//
//  Created by Mao Li on 4/25/19.
//  Copyright © 2019 MaoLi. All rights reserved.
//

import UIKit

class MusicLoadFooter: UICollectionReusableView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        let aiv = UIActivityIndicatorView(style: .whiteLarge)
        aiv.color = .darkGray
        aiv.startAnimating()
        
        let label = UILabel(text: "Loading more ...", font: .systemFont(ofSize: 16))
        label.textAlignment = .center
        let stackview = UIStackView(arrangedSubviews: [
            aiv,label
            ])
        stackview.axis = .vertical
        stackview.spacing = 15
        
        addSubview(stackview)
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackview.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stackview.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
