//
//  AppPromotionController.swift
//  AppStoreJSONApis
//
//  Created by Mao Li on 4/13/19.
//  Copyright © 2019 MaoLi. All rights reserved.
//

import UIKit

private let cellID = "Cell"

class AppPromotionController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {

    var socialApps = [promotionObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor = .white
        self.collectionView.register(AppPromotionCell.self, forCellWithReuseIdentifier: cellID)
//        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
//            layout.scrollDirection = .horizontal
//        }
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AppPromotionCell
        let socialApp = socialApps[indexPath.item]
        cell.promotionImage.sd_setImage(with: URL(string: socialApp.imageUrl))
        cell.smallLabel.text = socialApp.name
        cell.titleLabel.text = socialApp.tagline
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return socialApps.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width - 48, height: self.view.frame.height)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
//    }

}
