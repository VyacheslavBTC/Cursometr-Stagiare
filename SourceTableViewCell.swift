//
//  SourceTableViewCell.swift
//  Cursometr
//
//  Created by test on 27.07.17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class SourceTableViewCell: UITableViewCell {

    @IBOutlet weak var sourceName: UILabel!
    
    @IBOutlet weak var sourceSwitcher: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.sourceName.translatesAutoresizingMaskIntoConstraints = false
        self.sourceName.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        self.sourceName.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        self.sourceName.sizeToFit()
        self.sourceName.font = UIFont.systemFont(ofSize: 16, weight: UIFontWeightMedium)
        self.sourceName.textColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.5)
        self.sourceSwitcher.translatesAutoresizingMaskIntoConstraints = false
        self.sourceSwitcher.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        self.sourceSwitcher.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        self.selectionStyle = .none
        self.backgroundColor = .none
        self.sourceSwitcher.onTintColor = UIColor.init(red: 90/255, green: 200/255, blue: 250/255, alpha: 1)
    }
    func configure(source: Source2){
        self.sourceName.text = source.sourceName
        if source.subscribed == false{
            self.sourceSwitcher.isOn = false
        }
        else {
            self.sourceName.textColor = UIColor.init(red: 90/255, green: 200/255, blue: 250/255, alpha: 1)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
