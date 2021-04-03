//
//  AppsController.swift
//  appStoreDemo
//
//  Created by thunder on 3/04/21.
//

import UIKit

class AppsController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .yellow
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: AppsGroupCell.identifier)
    }

    
    // MARK: - Data source and delegate
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier:AppsGroupCell.identifier,
                for: indexPath) as? AppsGroupCell
        else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: view.frame.width, height: 250)
    }
    
    
    
    
}



