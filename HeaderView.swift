//
//  HeaderView.swift
//  Cursometr
//
//  Created by test on 10.07.17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

protocol FeedbackDelegate{
    func leaveFeedback()
}
protocol QuotationsListDelegate{
    func showQuotationsList()
}

class HeaderView: UIView {
    
    var delegateFeedback:FeedbackDelegate!
    var delegateQuotationsList: QuotationsListDelegate!
    
    @IBOutlet weak var otherQuotationsButton: UIButton!
    @IBOutlet weak var leaveFeedbackButton: UIButton!
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
    
    @IBAction func showQuotationsList(_ sender: Any) {
        delegateQuotationsList.showQuotationsList()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        UINib(nibName: "HeaderView", bundle: nil).instantiate(withOwner: self, options: nil)
        self.addSubview(headerView)
        self.frame = self.bounds
        self.headerView.layer.addSublayer(lineUnderCurrentQuotationLayer)
        self.headerView.layer.addSublayer(lineUnderOtherQuotationLayer)
        self.currentQuotationLabel.translatesAutoresizingMaskIntoConstraints = false
        self.leaveFeedbackButton.translatesAutoresizingMaskIntoConstraints = false
        self.otherQuotationsButton.translatesAutoresizingMaskIntoConstraints = false
        self.headerView.backgroundColor = .none
        self.backgroundColor = .none
        self.configure()
        self.otherQuotationsButton.tintColor = UIColor.init(red: 90/255, green: 200/255, blue: 250/255, alpha: 1)
        self.headerView.setNeedsUpdateConstraints()
        
    }
    
    @IBAction func feedBackButtonPressed(_ sender: Any) {
        delegateFeedback.leaveFeedback()
    }
    
    override func updateConstraints() {
    
        
        self.currentQuotationLabel.leftAnchor.constraint(equalTo: self.headerView.leftAnchor, constant: 16).isActive = true
        self.currentQuotationLabel.topAnchor.constraint(equalTo: self.headerView.topAnchor, constant: 0).isActive = true
        
        self.leaveFeedbackButton.rightAnchor.constraint(equalTo: self.headerView.rightAnchor, constant: -16).isActive = true
        self.leaveFeedbackButton.centerYAnchor.constraint(equalTo: self.currentQuotationLabel.centerYAnchor, constant: 0).isActive = true
        
        
        self.otherQuotationsButton.leftAnchor.constraint(equalTo: self.headerView.leftAnchor, constant: 16).isActive = true
        self.otherQuotationsButton.topAnchor.constraint(equalTo: self.currentQuotationLabel.bottomAnchor, constant: 24).isActive = true
        self.otherQuotationsButton.rightAnchor.constraint(equalTo: self.headerView.rightAnchor, constant: 16).isActive = true
        
        self.lineUnderCurrentQuotationLayer.frame = CGRect(x: 16, y: self.currentQuotationLabel.bounds.height + 16, width: self.headerView.frame.width - 32, height: 1)
        
        self.lineUnderOtherQuotationLayer.frame = CGRect(x: 16, y: self.otherQuotationsButton.bounds.height + 72, width: self.headerView.frame.width - 32, height: 1)

        super.updateConstraints()
        }
    
    func configure(){
    }

}
