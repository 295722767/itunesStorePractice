//
//  BaseList.swift
//  AppStoreJSONApis
//
//  Created by Mao Li on 4/11/19.
//  Copyright © 2019 MaoLi. All rights reserved.
//

import UIKit

class BaseListController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
