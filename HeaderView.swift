//
//  HeaderView.swift
//  Cursometr
//
//  Created by test on 10.07.17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    

    @IBOutlet weak var leaveFeedbackButton: UIButton!
    @IBOutlet weak var otherQuotationsLabel: UILabel!
    @IBOutlet weak var currentQuotationLabel: UILabel!
    @IBOutlet var headerView: UIView!
    
    private lazy var lineUnderCurrentQuotationLayer: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.1).cgColor
        return layer
    }()
    
    private lazy var lineUnderOtherQuotationLayer: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.1).cgColor
        return layer
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        UINib(nibName: "HeaderView", bundle: nil).instantiate(withOwner: self, options: nil)
        self.addSubview(headerView)
        self.frame = self.bounds
        self.headerView.layer.addSublayer(lineUnderCurrentQuotationLayer)
        self.headerView.layer.addSublayer(lineUnderOtherQuotationLayer)
        self.currentQuotationLabel.translatesAutoresizingMaskIntoConstraints = false
        self.leaveFeedbackButton.translatesAutoresizingMaskIntoConstraints = false
        self.otherQuotationsLabel.translatesAutoresizingMaskIntoConstraints = false
        self.headerView.backgroundColor = .none
        self.backgroundColor = .none
        self.configure()
        self.headerView.setNeedsUpdateConstraints()
    }
    
    
    override func updateConstraints() {
        
        self.currentQuotationLabel.leftAnchor.constraint(equalTo: self.headerView.leftAnchor, constant: 16).isActive = true
        self.currentQuotationLabel.topAnchor.constraint(equalTo: self.headerView.topAnchor, constant: 20).isActive = true
        
        self.leaveFeedbackButton.rightAnchor.constraint(equalTo: self.headerView.rightAnchor, constant: -16).isActive = true
        self.leaveFeedbackButton.centerYAnchor.constraint(equalTo: self.currentQuotationLabel.centerYAnchor, constant:0 ).isActive = true
        
        self.otherQuotationsLabel.leftAnchor.constraint(equalTo: self.headerView.leftAnchor, constant: 16).isActive = true
        self.otherQuotationsLabel.bottomAnchor.constraint(equalTo: self.headerView.bottomAnchor, constant: -24).isActive = true
        
        
        self.lineUnderCurrentQuotationLayer.frame = CGRect(x: 16, y: self.currentQuotationLabel.bounds.height + 32, width: self.headerView.frame.width - 32, height: 1)
        
        self.lineUnderOtherQuotationLayer.frame = CGRect(x: 16, y: self.headerView.frame.height - 16, width: self.headerView.frame.width - 32, height: 1)

        
       // self.currentQuotationUnderLineView.centerYAnchor.constraint(equalTo: self.headerView.topAnchor, constant: 60).isActive = true
       // self.currentQuotationUnderLineView.leftAnchor.constraint(equalTo: self.headerView.leftAnchor, constant: 16).isActive = true
       // self.currentQuotationUnderLineView.rightAnchor.constraint(equalTo: self.headerView.rightAnchor, constant: -16).isActive = true
       // self.currentQuotationUnderLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        super.updateConstraints()
        }
    
    func configure(){
    }

}
