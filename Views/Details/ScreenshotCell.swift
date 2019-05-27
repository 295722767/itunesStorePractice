//
//  ScreenshotCell.swift
//  AppStoreJSONApis
//
//  Created by Mao Li on 4/23/19.
//  Copyright © 2019 MaoLi. All rights reserved.
//

import UIKit

class ScreenshotCell: UICollectionViewCell {
    
    let screenshotImageView = UIImageView(cornerRadius: 12)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(screenshotImageView)
        screenshotImageView.translatesAutoresizingMaskIntoConstraints = false
        screenshotImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        screenshotImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        screenshotImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        screenshotImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
