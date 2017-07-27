//
//  FeedbackSubjectTableViewCell.swift
//  Cursometr
//
//  Created by test on 22.07.17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class FeedbackSubjectTableViewCell: UITableViewCell {

    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .none
        self.subjectLabel.textColor = UIColor.gray
        
        self.subjectLabel.translatesAutoresizingMaskIntoConstraints = false
        self.subjectLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        self.subjectLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        self.subjectLabel.sizeToFit()
        
        self.checkImage.translatesAutoresizingMaskIntoConstraints = false
        self.checkImage.leftAnchor.constraint(equalTo: self.rightAnchor, constant: -32).isActive = true
        self.checkImage.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

    func configure(rowNumber: Int){
        if rowNumber == 0
        {
            subjectLabel.text = "Add source"
        }
        if rowNumber == 1
        {
            subjectLabel.text = "Add quotation"
        }
        if rowNumber == 2
        {
            subjectLabel.text = "Add function"
        }
        if rowNumber == 3
        {
            subjectLabel.text = "Another"
        }
        self.checkImage.isHidden = true
    }
}
