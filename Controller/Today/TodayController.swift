//
//  TodayController.swift
//  AppStoreJSONApis
//
//  Created by Mao Li on 5/5/19.
//  Copyright © 2019 MaoLi. All rights reserved.
//

import UIKit


class TodayController: BaseListController, UICollectionViewDelegateFlowLayout {
    private let cellId = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor = #colorLiteral(red: 0.8939658999, green: 0.8941159844, blue: 0.8939461112, alpha: 1)
        self.collectionView.register(TodayCell.self, forCellWithReuseIdentifier: cellId)
        self.navigationController?.isNavigationBarHidden = true
    }
    

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TodayCell
        return cell
    }
    
    var startingFrame: CGRect?
    var appFullScreenController = UITableViewController()
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let appFullScreenController = AppFullScreenController()
        let controllerView = appFullScreenController.view!
        controllerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissView)))
        self.view.addSubview(controllerView)
        addChild(appFullScreenController)
        self.appFullScreenController = appFullScreenController
        
        // get each selected cell
        guard let cell = self.collectionView.cellForItem(at: indexPath) else { return }
        
        // absolute coordinates of cell
        guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
        self.startingFrame = startingFrame
        controllerView.frame = startingFrame
        controllerView.layer.cornerRadius = 16
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            controllerView.frame = self.view.frame
            self.tabBarController?.tabBar.transform = CGAffineTransform(translationX: 0, y: 100)
        }, completion: nil)
    }
    
    @objc func dismissView(gesture: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            gesture.view?.frame = self.startingFrame ?? .zero
            //self.tabBarController?.tabBar.transform = CGAffineTransform(translationX: 0, y: 0)
            self.tabBarController?.tabBar.transform = .identity
        }, completion: { _ in
            gesture.view?.removeFromSuperview()
            self.appFullScreenController.removeFromParent()
        })
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width - 64, height: 450)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 32, left: 0, bottom: 32, right: 0)
    }
    
    

}
