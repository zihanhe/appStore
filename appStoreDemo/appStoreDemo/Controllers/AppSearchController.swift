//
//  AppSearchController.swift
//  appStoreDemo
//
//  Created by thunder on 28/03/21.
//

import UIKit


class AppSearchController: UICollectionViewController {

    
    var appResults = [ResultItem]()
    var searchResultViewModels = [SearchResultCellModel]()
    var searchTimer: Timer?

    fileprivate let searchController = UISearchController(searchResultsController: nil)
    
    fileprivate let enterSearchTermLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .secondaryLabel
        label.text = NSLocalizedString("Search_SearchBar_Placholder", comment: "")
        return label
    }()
    
    // MARK: - Init

    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) has not been implemented")
    }
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white

        self.collectionView!.register(SearchResultCell.self, forCellWithReuseIdentifier: SearchResultCell.identifier)
        
        setupSearchBar()
        collectionView.addSubview(enterSearchTermLabel)
        enterSearchTermLabel.fillSuperview(padding: .init(top: 100, left: 50, bottom: 0, right: 50))
        
    }
    
    // UI Layout
    private func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        
        searchController.searchBar.delegate = self
    }

    // MARK: Fetch Data
    
    fileprivate func fetchITunesApps(with string: String = "") {
        let searchParamater = "&term=" + string
        APICaller.shared.searchApps(withParamater: searchParamater, type: .GET) {[weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let searchResults):
                    self?.appResults = searchResults.results
                    self?.collectionView.reloadData()
                    
                case .failure(let error):
                    print(error.localizedDescription)
                break
                }
            }
        }
    }

    // MARK: - Collection View Delegate

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCell.identifier, for: indexPath) as? SearchResultCell  else {
            return UICollectionViewCell()
        }
        
        let result = appResults[indexPath.row]
        
        cell.model =  SearchResultCellModel(
            artworkUrl100: URL(string: result.artworkUrl100 ?? ""),
            trackName: result.trackName,
            primaryGenreName: result.primaryGenreName,
            averageUserRating: result.averageUserRating,
            screenshotUrls: result.screenshotUrls.compactMap({URL(string: $0 )})
        )
        
        return cell
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        enterSearchTermLabel.isHidden = appResults.count != 0
        return self.appResults.count
    }
    
    
}

// MARK: - FlowLayout Delegate

extension AppSearchController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
}


// MARK: - SearchBar Delegate

extension AppSearchController: UISearchBarDelegate {
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        // some dealy befor performing the search API
        searchTimer?.invalidate()
        
        searchTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            
            // fire the search call
            print (searchText)
            let searchParamater = "&term=" + searchText.trimmingCharacters(in: .whitespacesAndNewlines)

            APICaller.shared.searchApps(withParamater: searchParamater, type: .GET) { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    
                    case .success(let searchResults):
                        self?.appResults = searchResults.results
                        self?.collectionView.reloadData()
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        })
    }
}
