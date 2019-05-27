//
//  AppHeader.swift
//  AppStoreJSONApis
//
//  Created by Mao Li on 4/13/19.
//  Copyright © 2019 MaoLi. All rights reserved.
//

import UIKit

class AppHeader: UICollectionReusableView {
    
    let promotionController = AppPromotionController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .purple
        addSubview(promotionController.view)
        promotionController.view.translatesAutoresizingMaskIntoConstraints = false
        promotionController.view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        promotionController.view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        promotionController.view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        promotionController.view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
