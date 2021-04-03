//
//  VerticalStackView.swift
//  appStoreDemo
//
//  Created by thunder on 28/03/21.
//

import UIKit

class VerticalStackView: UIStackView {

    init(arrangedSubviews: [UIView], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        
        arrangedSubviews.forEach({addArrangedSubview($0)})
        
        self.spacing = spacing
        self.axis = .vertical

    }
    
    required init(coder: NSCoder) {
            fatalError(" init(coder: NSCoder) is missing")
    }
}
