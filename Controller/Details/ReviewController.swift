//
//  ReviewController.swift
//  AppStoreJSONApis
//
//  Created by Mao Li on 4/23/19.
//  Copyright © 2019 MaoLi. All rights reserved.
//

import UIKit


class ReviewController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {

    private let cellId = "Cell"
    
    var reviews: Reviews? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        self.collectionView!.register(ReviewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return reviews?.feed.entry.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ReviewCell
        let entry = reviews?.feed.entry[indexPath.item]
        cell.titleLabel.text = entry!.title.label
        cell.nameLabel.text = entry!.author.name.label
        cell.contentLabel.text = entry!.content.label
        for (index, view) in cell.starStackView.arrangedSubviews.enumerated() {
            if let ratingInt = Int(entry!.rating.label) {
                view.alpha = index >= ratingInt ? 0 : 1
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 48, height: view.frame.height)
    }
    
}
