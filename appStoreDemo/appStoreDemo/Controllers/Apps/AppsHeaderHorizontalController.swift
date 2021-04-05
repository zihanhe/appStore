//
//  AppsHeaderHorizontalController.swift
//  appStoreDemo
//
//  Created by thunder on 4/04/21.
//

import UIKit

class AppsHeaderHorizontalController : BaseListController, UICollectionViewDelegateFlowLayout {
    
    let cellID = "AppsHeaderHorizontalCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .brown
        
        collectionView.register(AppsPageHeaderCell.self, forCellWithReuseIdentifier: AppsPageHeaderCell.identifier)
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 40, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 16, bottom: 0, right: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsPageHeaderCell.identifier,
                                                            for: indexPath
        ) as? AppsPageHeaderCell else {
            return UICollectionViewCell()
        }
        
        
        return cell
    }
    
}
