//
//  QuotationSubscribeTableViewCell.swift
//  Cursometr
//
//  Created by test on 25.07.17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class QuotationSubscribeTableViewCell: UITableViewCell {

    var currency:CurrencyWithSources! = nil
    
    @IBOutlet weak var sourcesLabel: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    @IBOutlet weak var currencyNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.currencyNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.currencyNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        self.currencyNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        self.currencyNameLabel.sizeToFit()
    
        self.checkImage.translatesAutoresizingMaskIntoConstraints = false
        self.checkImage.leftAnchor.constraint(equalTo: self.currencyNameLabel.rightAnchor, constant: 16).isActive = true
        self.checkImage.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        
        self.sourcesLabel.translatesAutoresizingMaskIntoConstraints = false
        self.sourcesLabel.leftAnchor.constraint(equalTo: self.checkImage.rightAnchor, constant: 48).isActive = true
        self.sourcesLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        self.sourcesLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true

        self.sourcesLabel.font = UIFont.systemFont(ofSize: 16, weight: UIFontWeightMedium)
        self.sourcesLabel.textColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.5)
        self.selectionStyle = .none
        self.currencyNameLabel.textColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.5)
        
        self.backgroundColor = .none
    }
    
    func configure(currency: CurrencyWithSources){
        self.sourcesLabel.text = ""
        self.currency = currency
        self.currencyNameLabel.text = currency.currencyName
        if self.currency.enable == false{
            self.checkImage.isHidden = true
        }
        else{
            for var source in currency.arrayOfSources{
                    if source.subscribed == true{
                        self.sourcesLabel.text! = self.sourcesLabel.text! + source.sourceName + ","
                    }
                
                }
            if self.sourcesLabel.text != ""{
                self.sourcesLabel.text?.remove(at: (sourcesLabel.text?.index(before: (sourcesLabel.text?.endIndex)!))!)
            }
        }
        if self.currency.enable == true{
            self.currencyNameLabel.textColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
