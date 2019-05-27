//
//  AppDetailController.swift
//  AppStoreJSONApis
//
//  Created by Mao Li on 4/20/19.
//  Copyright © 2019 MaoLi. All rights reserved.
//

import UIKit

class AppDetailController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    private let detailCellId = "detailID"
    private let previewId = "previewID"
    private let reviewId = "reviewID"
    
    var app: Result?
    var reviews: Reviews?
    var appId: String! {
        didSet {
            let urlString = "https://itunes.apple.com/lookup?id=\(appId ?? "")"
            Service.shared.fetchGenericJSONData(urlString: urlString) { (result: SearchResult?, err) in
                self.app = result?.results.first
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
            let reviewUrl = "https://itunes.apple.com/rss/customerreviews/page=1/id=\(appId ?? "")/sortby=mostrecent/json?l=en&cc=us"
            Service.shared.fetchGenericJSONData(urlString: reviewUrl) { (reviews: Reviews?, err) in
                if let err = err {
                    print("Failed to decode reviews:", err)
                    return
                }
                self.reviews = reviews
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        self.collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: detailCellId)
        self.collectionView.register(PreviewCell.self, forCellWithReuseIdentifier: previewId)
        self.collectionView.register(ReviewRowCell.self, forCellWithReuseIdentifier: reviewId)
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailCellId, for: indexPath) as! AppDetailCell
            //cell.app = app
            cell.nameLabel.text = app?.trackName
            cell.releaseNotesLabel.text = app?.releaseNotes
            cell.appIconImageView.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))
            cell.priceButton.setTitle(app?.formattedPrice, for: .normal)
            return cell
        } else if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: previewId, for: indexPath) as! PreviewCell
            cell.previewController.app = app
//            cell.previewController.app = app
//            cell.previewController.collectionView.reloadData()
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reviewId, for: indexPath) as! ReviewRowCell
            cell.reviewController.reviews = self.reviews
            return cell
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            // calculate the necessary size for our cell somehow
            let dummyCell = AppDetailCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
            //dummyCell.app = app
            dummyCell.nameLabel.text = app?.trackName
            dummyCell.releaseNotesLabel.text = app?.releaseNotes
            dummyCell.appIconImageView.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))
            dummyCell.priceButton.setTitle(app?.formattedPrice, for: .normal)
            dummyCell.layoutIfNeeded()
            let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
            return CGSize(width: self.view.frame.width, height: estimatedSize.height)
        } else if indexPath.item == 1 {
            return CGSize(width: self.view.frame.width, height: 500)
        } else {
            return CGSize(width: self.view.frame.width, height: 250)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0)
    }
    
}

