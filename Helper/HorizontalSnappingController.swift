//
//  HorizontalController.swift
//  AppStoreJSONApis
//
//  Created by Mao Li on 4/19/19.
//  Copyright © 2019 MaoLi. All rights reserved.
//

import UIKit
class HorizontalSnappingController: UICollectionViewController {
    
    init() {
        let layout = betterSnappingLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
        collectionView.decelerationRate = .fast
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//class SnappingLayout: UICollectionViewFlowLayout {
//    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
//        guard let collectionView = collectionView else { return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity) }
//        let parent = super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
//
//        let itemWidth = collectionView.frame.width - 48
//        let itemSpace = itemWidth + minimumInteritemSpacing
//        var pageNumber = round(collectionView.contentOffset.x / itemSpace)
//
//        // Skip to the next cell, if there is residual scrolling velocity left.
//        // This helps to prevent glitches
//        let vX = velocity.x
//        if vX > 0 {
//            pageNumber += 1
//        } else if vX < 0 {
//            pageNumber -= 1
//        }
//
//        let nearestPageOffset = pageNumber * itemSpace
//        return CGPoint(x: nearestPageOffset,
//                       y: parent.y)
//    }
//}

class betterSnappingLayout: UICollectionViewFlowLayout {
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = collectionView else { return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity) }
        
        var offsetAdjustment = CGFloat.greatestFiniteMagnitude
        let horizontalOffset = proposedContentOffset.x + collectionView.contentInset.left
        
        let targetRect = CGRect(x: proposedContentOffset.x, y: 0, width: collectionView.bounds.size.width, height: collectionView.bounds.size.height)
        
        let layoutAttributesArray = super.layoutAttributesForElements(in: targetRect)
        
        layoutAttributesArray?.forEach({ (layoutAttributes) in
            let itemOffset = layoutAttributes.frame.origin.x
            if fabsf(Float(itemOffset - horizontalOffset)) < fabsf(Float(offsetAdjustment)) {
                offsetAdjustment = itemOffset - horizontalOffset
            }
        })
        
        return CGPoint(x: proposedContentOffset.x + offsetAdjustment, y: proposedContentOffset.y)
    }
}
