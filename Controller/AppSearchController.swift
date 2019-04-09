//
//  AppSearchController.swift
//  AppStoreJSONApis
//
//  Created by Mao Li on 4/6/19.
//  Copyright © 2019 MaoLi. All rights reserved.
//

import UIKit
import SDWebImage

private let cellID = "cellID"

class AppSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor = .white
        self.collectionView!.register(SearchResultCell.self, forCellWithReuseIdentifier: cellID)
        fetchItunesApp()
    }
    
    fileprivate var appResults = [Result]()
    
    fileprivate func fetchItunesApp() {
        Service.shared.fetchApps { (results, err) in
            if let err = err {
                print("Failed to fetch Error", err)
                return
            }
            self.appResults = results
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
//        original way to fetch data
//        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
//        guard let url = URL(string: urlString)  else { return }
//        URLSession.shared.dataTask(with: url) { (data, resp, err) in
//            if let err = err {
//                print("Failed to fetch apps:", err)
//                return
//            }
//            //success
//            guard let data = data else { return }
//            do {
//                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
//                self.appResults = searchResult.results
//                DispatchQueue.main.async {
//                    self.collectionView.reloadData()
//                }
//            } catch let jsonErr {
//                print("Failed to decode json:", jsonErr)
//            }
//        }.resume()     // fires off the request   MOST IMPORTANT
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SearchResultCell
        let appResult = appResults[indexPath.item]
        cell.nameLabel.text = appResult.trackName
        cell.categoryLabel.text = appResult.primaryGenreName
        cell.ratingLabel.text = "Rating: " + String(appResult.averageUserRating ?? 0)
        let url = URL(string: appResult.artworkUrl100)
        cell.appIconImageView.sd_setImage(with: url)
        cell.screenshot1ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[0]))
        if (appResult.screenshotUrls.count > 1) {
            cell.screenshot2ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[1]))
        }
        if (appResult.screenshotUrls.count > 2) {
            cell.screenshot3ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[2]))
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 300)
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
