//
//  AppsController.swift
//  appStoreDemo
//
//  Created by thunder on 3/04/21.
//

import UIKit

class AppsPageController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    let headerID = "headerID"
    
    var editorsChoiceGames: AppGroup?
    var editorsChoiceGamesViewModel: AppsGroupCellViewModel?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .systemBackground
        collectionView.register(AppsGroupCell.self,
                                forCellWithReuseIdentifier: AppsGroupCell.identifier
        )
        
        collectionView.register(AppsPageHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: AppsPageHeaderView.identifier
        )
        
        fetchData()
    }
    
    
    // MARK: - Data source and delegate
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let result =  editorsChoiceGamesViewModel == nil ? 0 : 1
        return result
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier:AppsGroupCell.identifier,
                for: indexPath) as? AppsGroupCell
        else {
            return UICollectionViewCell()
        }
        
        
        cell.viewModel = editorsChoiceGamesViewModel
        
        return cell
    }
    
    // SupplementaryViewOfKind for Header
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let headerView = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: AppsPageHeaderView.identifier,
            for: indexPath
        ) as? AppsPageHeaderView, kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        
        return headerView
    }
    
    // Header view size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    // MARK: - Fetch Data

    private func fetchData() {
        APICaller.shared.fetchGames { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self?.editorsChoiceGames = data
                    self?.editorsChoiceGamesViewModel = AppsGroupCellViewModel(
                        title: data.feed.title,
                        cellModels: data.feed.results.compactMap(
                            {AppsRowCellViewModel(name:$0.name ,
                                                  companyName: $0.artistName,
                                                  imageURL: URL(string: $0.artworkUrl100 ?? ""))
                            }
                        )
                    )
                    
                    self?.collectionView.reloadData()
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        
    }
}



