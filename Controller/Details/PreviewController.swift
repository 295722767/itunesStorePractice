//
//  PreviewController.swift
//  AppStoreJSONApis
//
//  Created by Mao Li on 4/23/19.
//  Copyright © 2019 MaoLi. All rights reserved.
//

import UIKit



class PreviewController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {

    private let cellId = "Cell"
    
    //var app: Result?
    
    var app: Result? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        self.collectionView!.register(ScreenshotCell.self, forCellWithReuseIdentifier: cellId)
    }

    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return app?.screenshotUrls!.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ScreenshotCell
        cell.screenshotImageView.sd_setImage(with: URL(string: app?.screenshotUrls![indexPath.item] ?? ""))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: view.frame.height)
    }
}
