//
//  SearchResultCell.swift
//  appStoreDemo
//
//  Created by thunder on 28/03/21.
//

import UIKit
import SDWebImage

class SearchResultCell: UICollectionViewCell {
    static let identifier = "SearchResultCell"

    // MARK: - View Elements

    var model: SearchResultCellModel! {
        didSet{
                nameLabel.text = model.trackName
                categoryLabel.text = model.primaryGenreName
                ratingsLable.text = "Rating: \(model.averageUserRating ?? 0)"
                
                appIconImageView.sd_setImage(with: model.artworkUrl100, completed: nil)
                
                if model.screenshotUrls.indices.contains(0) {
                    screenshotImageLeft.sd_setImage(with: model.screenshotUrls[0], completed: nil)
                }
                
                if model.screenshotUrls.indices.contains(1) {
                    screenshotImageMiddle.sd_setImage(with: model.screenshotUrls[1], completed: nil)
                }
                
                if model.screenshotUrls.indices.contains(2) {
                    screenshotImageRight.sd_setImage(with: model.screenshotUrls[2], completed: nil)
                }
        }
    }
    
    

    let appIconImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = .white
        imgView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        imgView.layer.cornerRadius = 12
        imgView.layer.masksToBounds = true
        
        return imgView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "app Name"
        label.textColor = .label
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "category type"
        label.textColor = .secondaryLabel
        return label
    }()

    let ratingsLable: UILabel = {
        let label = UILabel()
        label.text = "2.1M"
        label.textColor = .secondaryLabel
        return label
    }()

    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = .init(white: 0.95, alpha: 1)
        
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true

        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true

        return button
    }()
    
    lazy var screenshotImageLeft = self.createScreenshotImageView()
    lazy var screenshotImageMiddle = self.createScreenshotImageView()
    lazy var screenshotImageRight = self.createScreenshotImageView()
    
    func createScreenshotImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemBackground
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor(white: 0.4, alpha: 0.5).cgColor
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) is missing")
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .systemBackground
        
        let infoTopStackView = UIStackView(arrangedSubviews:
                                            [appIconImageView,
                                             VerticalStackView(arrangedSubviews: [nameLabel, categoryLabel, ratingsLable]),
                                             getButton
                                            ]
        )
        infoTopStackView.spacing = 12
        infoTopStackView.alignment = .center

        let screenshotStackView = UIStackView(arrangedSubviews: [screenshotImageLeft,
                                                                 screenshotImageMiddle,
                                                                 screenshotImageRight]
        )
        
        screenshotStackView.spacing = 12
        screenshotStackView.distribution = .fillEqually
        
        let overAllStackView = VerticalStackView(arrangedSubviews: [infoTopStackView, screenshotStackView],
                                                 spacing: 16)

        addSubview(overAllStackView)
        overAllStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    // MARK: - Config cell
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        appIconImageView.image = nil
        categoryLabel.text = nil
        ratingsLable.text = nil
        nameLabel.text = nil
        
        screenshotImageLeft.image = nil
        screenshotImageMiddle.image = nil
        screenshotImageRight.image = nil
    }
}
