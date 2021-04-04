//
//  AppsGroupCell.swift
//  appStoreDemo
//
//  Created by thunder on 3/04/21.
//

import UIKit

class AppsGroupCell: UICollectionViewCell {
    
    static let identifier = "AppsGroupCell"
    
    let horizontalController = AppsHorizontalController()
    
    
    //MARK: - UI Elements
    let titleLabel: UILabel = {
        let label = UILabel.init(text: "App Section", font: .boldSystemFont(ofSize: 30))
        label.textColor = .label
        return label
    }()
    
    //Mark: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .secondarySystemBackground
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor,
                          leading: leadingAnchor,
                          bottom: nil,
                          trailing: trailingAnchor,
                          padding: .init(top: 0, left: 16, bottom: 0, right: 0)
        )
        
        addSubview(horizontalController.view)
        
        horizontalController.view.anchor(top: titleLabel.bottomAnchor,
                                         leading: leadingAnchor,
                                         bottom: bottomAnchor,
                                         trailing: trailingAnchor
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) is missing")
    }
    
}
