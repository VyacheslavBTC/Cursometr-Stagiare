//
//  VerticalResourcesTableViewCell.swift
//  Cursometr
//
//  Created by test on 12.07.17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class VerticalResourcesTableViewCell: UITableViewCell {

    @IBOutlet weak var notificationImageFrom1Purchase: UIImageView!
    @IBOutlet weak var purchaseLabel: UILabel!
    @IBOutlet weak var priceOfPurchaseFrom1Label: UILabel!
    @IBOutlet weak var from1Label: UILabel!
    
    //Добавить все аутлеты?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
