//
//  AppsPageHeaderView.swift
//  appStoreDemo
//
//  Created by thunder on 4/04/21.
//

import UIKit

class AppsPageHeaderView: UICollectionReusableView {
    static let identifier = "AppsPageHeaderView"
    
    let appHeaderHorizontalController = AppsHeaderHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(appHeaderHorizontalController.view)
        appHeaderHorizontalController.view.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("required init?(coder: NSCoder) is missing")
    }
}
