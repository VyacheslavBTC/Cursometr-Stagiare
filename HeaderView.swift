//
//  HeaderView.swift
//  Cursometr
//
//  Created by test on 10.07.17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    

    @IBOutlet weak var currentQuotationUnderLineView: UIView!
    @IBOutlet weak var otherQuotationsUnderLineView: UIView!
    @IBOutlet weak var leaveFeedbackButton: UIButton!
    @IBOutlet weak var otherQuotationsLabel: UILabel!
    @IBOutlet weak var currentQuotationLabel: UILabel!
    @IBOutlet var headerView: UIView!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        UINib(nibName: "HeaderView", bundle: nil).instantiate(withOwner: self, options: nil)
        self.addSubview(headerView)
        self.frame = self.bounds
        self.currentQuotationLabel.translatesAutoresizingMaskIntoConstraints = false
        self.leaveFeedbackButton.translatesAutoresizingMaskIntoConstraints = false
        self.currentQuotationUnderLineView.translatesAutoresizingMaskIntoConstraints = false
        self.configure()
        self.headerView.setNeedsUpdateConstraints()
    }
    
    override func updateConstraints() {
        print(self.headerView.frame.width)
        
        self.currentQuotationLabel.leftAnchor.constraint(equalTo: self.headerView.leftAnchor, constant: 16).isActive = true
        self.currentQuotationLabel.topAnchor.constraint(equalTo: self.headerView.topAnchor, constant: 16).isActive = true
        
        self.leaveFeedbackButton.rightAnchor.constraint(equalTo: self.headerView.rightAnchor, constant: -16).isActive = true
        self.leaveFeedbackButton.centerYAnchor.constraint(equalTo: self.currentQuotationLabel.centerYAnchor, constant:0 ).isActive = true
        
       // self.currentQuotationUnderLineView.topAnchor.constraint(equalTo: self.currentQuotationLabel.bottomAnchor, constant: 16).isActive = true
        self.currentQuotationUnderLineView.leftAnchor.constraint(equalTo: self.headerView.leftAnchor, constant: 16).isActive = true
        self.currentQuotationUnderLineView.rightAnchor.constraint(equalTo: self.headerView.rightAnchor, constant: -16).isActive = true
        super.updateConstraints()
        }
    
    func configure(){
        self.currentQuotationUnderLineView.backgroundColor = .white
        //code
        
    }

}
