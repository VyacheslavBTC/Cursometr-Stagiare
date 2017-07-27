//
//  HeaderLabelView.swift
//  Cursometr
//
//  Created by test on 28.07.17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class HeaderLabelView: UIView {

    lazy var label: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 30))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
    }
    func configure(labelText: String){
        self.addSubview(label)
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.label.textColor = .white
        self.label.font = label.font.withSize(22)
        self.label.topAnchor.constraint(equalTo: self.topAnchor, constant: -5).isActive = true
        self.label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        self.backgroundColor = .none
        self.label.text = labelText
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
