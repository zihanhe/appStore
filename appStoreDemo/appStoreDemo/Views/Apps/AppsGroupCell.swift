//
//  AppsGroupCell.swift
//  appStoreDemo
//
//  Created by thunder on 3/04/21.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
    }
}


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
        
        backgroundColor = .lightGray
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
        
        addSubview(horizontalController.view)
        
        horizontalController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) is missing")
    }
    
}
