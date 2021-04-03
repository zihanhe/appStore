//
//  BaseListController.swift
//  appStoreDemo
//
//  Created by thunder on 3/04/21.
//

import UIKit

class BaseListController: UICollectionViewController {
    
    // MARK: - Init
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) is missing")
    }
}
