//
//  File.swift
//  AppStoreJSONApis
//
//  Created by Mao Li on 4/10/19.
//  Copyright © 2019 MaoLi. All rights reserved.
//


import UIKit

class AppController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    private var cellID = "cellID"
    private var headerID = "headerID"
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .whiteLarge)
        aiv.color = .black
        aiv.startAnimating()
        aiv.hidesWhenStopped = true
        return aiv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(activityIndicatorView)
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        activityIndicatorView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.collectionView.backgroundColor = .white
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.register(AppHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
        fetchApps()
        
        //collectionView.isPagingEnabled = true
    }
    
    //old ones
    //var editorsChoice: AppGroup?
    var groups = [AppGroup]()
    var promotionApps = [promotionObject]()
    func fetchApps() {
        
        var group1: AppGroup?
        var group2: AppGroup?
        var group3: AppGroup?
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        Service.shared.fetchTopGames() { (appGroup, err) in
            if let err = err {
                print("Failed to fetch data", err)
                return
            }
            dispatchGroup.leave()
            group1 = appGroup
        }
        dispatchGroup.enter()
        Service.shared.fetchTopGrossing() { (appGroup, err) in
            if let err = err {
                print("Failed to fetch data", err)
                return
            }
            //old ones
            //self.editorsChoice = appGroup
            //DispatchQueue.main.async {
            //self.collectionView.reloadData()
            //}
            dispatchGroup.leave()
            group2 = appGroup
        }
        dispatchGroup.enter()
        Service.shared.fetchTopFree() { (appGroup, err) in
            if let err = err {
                print("Failed to fetch data", err)
                return
            }
            dispatchGroup.leave()
            group3 = appGroup
        }
        dispatchGroup.enter()
        Service.shared.fetchPromotion() {(promotionApps, err) in
            if let err = err {
                print("Failed to fetch data", err)
                return
            }
            dispatchGroup.leave()
            self.promotionApps = promotionApps ?? []
        }
        
        dispatchGroup.notify(queue: .main) {
            print("Completede your dispatch group task...")
            
            self.activityIndicatorView.stopAnimating()
            
            if let group = group1 {
                self.groups.append(group)
            }
            if let group = group2 {
                self.groups.append(group)
            }
            if let group = group3 {
                self.groups.append(group)
            }
            self.collectionView.reloadData()
        }
    }
    
    
    
    // cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AppsGroupCell
        //old ones
        //cell.titleLabel.text = editorsChoice?.feed.title
        //cell.horizontalController.appGroup = editorsChoice
        //cell.horizontalController.collectionView.reloadData()
        
        cell.titleLabel.text = groups[indexPath.item].feed.title
        cell.horizontalController.appGroup = groups[indexPath.item]
        cell.horizontalController.collectionView.reloadData()
        cell.horizontalController.didSelectHandler = { [weak self] feedResult in
            let controller = AppDetailController(collectionViewLayout: UICollectionViewFlowLayout())
            controller.appId = feedResult.id
            controller.navigationItem.title = feedResult.name
            self?.navigationController?.pushViewController(controller, animated: true)
        }
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
    }
    
    
    // collectionview header
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! AppHeader
        header.promotionController.socialApps = self.promotionApps
        header.promotionController.collectionView.reloadData()
        return header
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 340)
    }
    
}
