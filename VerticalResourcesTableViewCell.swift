//
//  VerticalResourcesTableViewCell.swift
//  Cursometr
//
//  Created by test on 12.07.17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class VerticalResourcesTableViewCell: UITableViewCell {
    
    var sourceData:Source?
    
    var rangeLabel:UILabel = UILabel()
    var buyPrice:UILabel = UILabel()
    var salePrice:UILabel = UILabel()
    var buyPriceUnder:UILabel = UILabel()
    var salePriceUnder:UILabel = UILabel()
    var notificationBuyImage: UIImage = UIImage()
    var notificationSaleImage: UIImage = UIImage()
    var saleImageView:UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 18, height: 18))
    var buyImageView:UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 18, height: 18))

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 20
        self.selectionStyle = UITableViewCellSelectionStyle.none
        self.layer.masksToBounds = true
        self.addSubview(self.rangeLabel)
        self.addSubview(self.buyPrice)
        self.addSubview(self.buyPriceUnder)
        self.addSubview(self.salePrice)
        self.addSubview(self.salePriceUnder)
        self.addSubview(self.saleImageView)
        self.addSubview(self.buyImageView)
        initializeElements()
    }
    
    func initializeElements(){
        
        self.rangeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.rangeLabel.frame  = CGRect(x: 0, y: 0, width: 36, height: 11)
        self.rangeLabel.text = "From"
        self.rangeLabel.font = self.rangeLabel.font.withSize(13)
        self.rangeLabel.textColor = .white
        self.rangeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        self.rangeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        
        self.buyPrice.frame  = CGRect(x: 0, y: 0, width: 54, height: 18)
        self.buyPrice.font = self.buyPrice.font.withSize(20)
        self.buyPrice.textColor = .white
        self.buyPrice.translatesAutoresizingMaskIntoConstraints = false
        self.buyPrice.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10).isActive = true
        self.buyPrice.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 87).isActive = true
        
        self.buyPriceUnder.frame  = CGRect(x: 0, y: 0, width: 54, height: 11)
        self.buyPriceUnder.text = "Purchase"
        self.buyPriceUnder.textColor = .white
        self.buyPriceUnder.font = self.buyPriceUnder.font.withSize(13)
        self.buyPriceUnder.translatesAutoresizingMaskIntoConstraints = false
        self.buyPriceUnder.topAnchor.constraint(equalTo: self.buyPrice.bottomAnchor, constant: 5).isActive = true
        self.buyPriceUnder.leftAnchor.constraint(equalTo: self.buyPrice.leftAnchor, constant: 0).isActive = true
        
        self.salePrice.frame  = CGRect(x: 0, y: 0, width: 54, height: 18)
        self.salePrice.font = self.salePrice.font.withSize(20)
        self.salePrice.textColor = .white
        self.salePrice.translatesAutoresizingMaskIntoConstraints = false
        self.salePrice.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10).isActive = true
        self.salePrice.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 220).isActive = true
        
        
        self.saleImageView.image = UIImage(named: "icn_notification_green")
        self.saleImageView.translatesAutoresizingMaskIntoConstraints = false
        self.saleImageView.centerYAnchor.constraint(equalTo: self.salePrice.centerYAnchor, constant: 0).isActive = true
        self.saleImageView.leftAnchor.constraint(equalTo: self.salePrice.rightAnchor, constant: 8).isActive = true

        
        self.buyImageView.image = UIImage(named: "icn_notification_green")
        self.buyImageView.translatesAutoresizingMaskIntoConstraints = false
        self.buyImageView.centerYAnchor.constraint(equalTo: self.buyPrice.centerYAnchor, constant: 0).isActive = true
        self.buyImageView.leftAnchor.constraint(equalTo: self.buyPrice.rightAnchor, constant: 8).isActive = true
        
        self.salePriceUnder.frame  = CGRect(x: 0, y: 0, width: 54, height: 11)
        self.salePriceUnder.text = "Sale"
        self.salePriceUnder.textColor = .white
        self.salePriceUnder.font = self.salePriceUnder.font.withSize(13)
        self.salePriceUnder.translatesAutoresizingMaskIntoConstraints = false
        self.salePriceUnder.topAnchor.constraint(equalTo: self.salePrice.bottomAnchor, constant: 5).isActive = true
        self.salePriceUnder.leftAnchor.constraint(equalTo: self.salePrice.leftAnchor, constant: 0).isActive = true
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func configure(sourceData:Source, index: Int){
        self.sourceData = sourceData
        
        self.buyPrice.text = String (sourceData.sourceRanges[index].sourceBuyPriceNow)
        self.salePrice.text = String (sourceData.sourceRanges[index].sourceSalePriceNow)
        
    }
}
