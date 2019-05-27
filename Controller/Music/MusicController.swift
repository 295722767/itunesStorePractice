//
//  MusicController.swift
//  AppStoreJSONApis
//
//  Created by Mao Li on 4/25/19.
//  Copyright © 2019 MaoLi. All rights reserved.
//

import UIKit


class MusicController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    fileprivate let cellId = "cellID"
    fileprivate let footerId = "footerId"
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = .white
        collectionView.register(MusicCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(MusicLoadFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerId)
        fetchData()
    }
    
    var results = [Result]()
    fileprivate let searchTerm = "taylor"
    
    func fetchData() {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&offset=0&limit=20"
        Service.shared.fetchGenericJSONData(urlString: urlString) { (searchResult: SearchResult?, err) in
            if let err = err {
                print("failed to fetch data", err)
                return
            }
            self.results = searchResult?.results ?? []
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    var isPaginating = false
    var isDonePaginating = false
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MusicCell
        let track = results[indexPath.item]
        cell.trackLabel.text = track.trackName
        cell.subtitleLabel.text = "\(track.artistName ?? "") • \(track.collectionName ?? "")"
        cell.appIconImageView.sd_setImage(with: URL(string: track.artworkUrl100))
        if indexPath.item == results.count - 1 && !isPaginating {
            isPaginating = true
            let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&offset=\(results.count)&limit=20"
            Service.shared.fetchGenericJSONData(urlString: urlString) { (searchResult: SearchResult?, err) in
                if let err = err {
                    print("failed to fetch data", err)
                    return
                }
                if searchResult?.results.count == 0 {
                    self.isDonePaginating = true
                }
                sleep(2)
                // +=   +=
                self.results += searchResult?.results ?? []
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                self.isPaginating = false
            }
        }
        
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 32, height: 120)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0)
    }
    
    
    //footer
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerId, for: indexPath)
        return footer
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        let height: CGFloat = isDonePaginating ? 0 : 90
        return CGSize(width: view.frame.width - 32, height: height)
    }

}
