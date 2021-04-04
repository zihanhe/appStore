//
//  AppRowCell.swift
//  appStoreDemo
//
//  Created by thunder on 3/04/21.
//

import UIKit

class AppRowCell: UICollectionViewCell {

    //MARK: - UI Elements

    static let identifier = "AppRowCell"
    let imageView = UIImageView(cornerRadius: 8)
    
    let nameLabel: UILabel = {
        let label = UILabel(text: "App Name", font: .systemFont(ofSize: 16))
        label.textColor = .label
        return label
    }()
    
    
    let companyLabel: UILabel = {
        let label = UILabel(text: "CompanyName", font: .systemFont(ofSize: 12))
        label.textColor = .secondaryLabel
        return label
    }()
    
    let getButton = UIButton(title: NSLocalizedString("GET", comment: ""))
    
    //Mark: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .secondarySystemBackground
        
        imageView.constrainWidth(constant: 64)
        imageView.constrainHeight(constant: 64)
        imageView.backgroundColor = .systemFill
        
        getButton.backgroundColor = .init(white: 0.95, alpha: 1)
        getButton.constrainHeight(constant: 32)
        getButton.constrainWidth(constant: 80)
        getButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        getButton.layer.cornerRadius = 32 / 2
        
        let stackView = UIStackView(arrangedSubviews: [
                                        imageView,
                                        VerticalStackView(arrangedSubviews: [nameLabel, companyLabel]),
                                        getButton])
        stackView.alignment = .center
        stackView.spacing = 16
        addSubview(stackView)
        stackView.fillSuperview()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("(coder: NSCoder) is missing")
    }
    
}
