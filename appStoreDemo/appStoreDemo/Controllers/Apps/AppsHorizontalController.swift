//
//  AppsHorizontalController.swift
//  appStoreDemo
//
//  Created by thunder on 3/04/21.
//

import UIKit

class AppsHorizontalController: BaseListController, UICollectionViewDelegateFlowLayout {

    let topBottomPadding: CGFloat = 12
    let lineSpacing: CGFloat = 10
    
    var rowCellModels: [AppsRowCellViewModel]?

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .systemBackground
        collectionView.register(AppRowCell.self , forCellWithReuseIdentifier: AppRowCell.identifier)
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout{
            layout.scrollDirection = .horizontal
        }
    }

    // MARK: - Data source and delegate
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rowCellModels?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppRowCell.identifier, for: indexPath) as? AppRowCell else {
            return UICollectionViewCell()
        }
        
        
        guard let model = rowCellModels?[indexPath.row] else {
            return UICollectionViewCell()
        }
        
        cell.viewModel = model
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = (view.frame.height - 2 * topBottomPadding - 2 * lineSpacing)/3
        
        return .init(width: view.frame.width - 48, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: topBottomPadding, left: 16, bottom: topBottomPadding, right: 16)
    }
}
