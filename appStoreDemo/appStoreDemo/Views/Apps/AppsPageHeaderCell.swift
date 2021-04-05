//
//  AppsPageHeaderCell.swift
//  appStoreDemo
//
//  Created by thunder on 4/04/21.
//

import UIKit

class AppsPageHeaderCell: UICollectionViewCell {
    
    static let identifier = "AppsPageHeaderCell"
    
    //MARK: - UI Elements
    let companyLabel: UILabel = UILabel(text: "FaceBook", font: .boldSystemFont(ofSize: 12))
    
    let titleLabel: UILabel = UILabel(text: "Keeping up with friends", font: .systemFont(ofSize: 22))
    
    let imageView = UIImageView(cornerRadius: 8)

    //MARK: - Life cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        companyLabel.textColor = .systemBlue
        titleLabel.numberOfLines = 0
        imageView.backgroundColor = .red
        
        let stackView = VerticalStackView(arrangedSubviews: [companyLabel, titleLabel, imageView],
                                          spacing: 12)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("required init?(coder: NSCoder) is missing")
    }
    
    
    override func prepareForReuse() {
        companyLabel.text = nil
        companyLabel.text = nil
        imageView.image = nil
    }
}
