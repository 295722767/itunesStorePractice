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

class AppSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

    fileprivate var searchController = UISearchController(searchResultsController: nil)
    
    fileprivate let enterSearchTermLabel: UILabel = {
        let label = UILabel()
        label.text = "Please enter search term above..."
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor = .white
        self.collectionView!.register(SearchResultCell.self, forCellWithReuseIdentifier: cellID)
        self.collectionView.addSubview(enterSearchTermLabel)
        enterSearchTermLabel.translatesAutoresizingMaskIntoConstraints = false
        enterSearchTermLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 300).isActive = true
        enterSearchTermLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50).isActive = true
        enterSearchTermLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50).isActive = true
        setupSearchBar()
    }
    
    fileprivate func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        enterSearchTermLabel.isHidden = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        appResults.removeAll()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            self.enterSearchTermLabel.isHidden = false
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        Service.shared.fetchApps(searchTerm: searchBar.text!) { (searchResult, err) in
            if let err = err {
                print("Failed to fetch Error", err)
                return
            }
            self.appResults = searchResult?.results ?? []
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
//    var timer: Timer?
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        timer?.invalidate()
//        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
//            Service.shared.fetchApps(searchTerm: searchText) { (results, err) in
//                if let err = err {
//                    print("Failed to fetch Error", err)
//                    return
//                }
//                self.appResults = results
//                DispatchQueue.main.async {
//                    self.collectionView.reloadData()
//                }
//            }
//        })
//    }
    
    
    fileprivate var appResults = [Result]()
    fileprivate func fetchItunesApp() {
        Service.shared.fetchApps(searchTerm: "Twitter") { (searchResult, err) in
            if let err = err {
                print("Failed to fetch Error", err)
                return
            }
            self.appResults = searchResult?.results ?? []
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
        cell.screenshot1ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls![0]))
        if (appResult.screenshotUrls!.count > 1) {
            cell.screenshot2ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls![1]))
        }
        if (appResult.screenshotUrls!.count > 2) {
            cell.screenshot3ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls![2]))
        }
        
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let appDetailController = AppDetailController(collectionViewLayout: UICollectionViewFlowLayout())
        appDetailController.appId = String(appResults[indexPath.item].trackId)
        navigationController?.pushViewController(appDetailController, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (appResults.count == 0) {
            enterSearchTermLabel.isHidden = false
            return 0
        } else {
            enterSearchTermLabel.isHidden = true
            return appResults.count
        }
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
