//
//  ResourcesCollectionViewCell.swift
//  Cursometr
//
//  Created by test on 11.07.17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class ResourcesCollectionViewCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate{
    
    var dataStruct:subscribedDataStruct?
    
    @IBOutlet weak var verticalTableView: UITableView!

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        //return self.items[section].array.count
        return 1
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vw = UIView()
        vw.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 24)
        let label = UILabel(frame: CGRect(x: 4, y: 4, width: vw.frame.width, height: 18))
        label.text = dataStruct?.arrayOfSources[0].sourceName
        label.textColor = .white
        label.font = label.font.withSize(22)
        //label.font = UIFont.boldSystemFont(ofSize: 22)
        vw.addSubview(label)
        vw.backgroundColor = .none
        return vw
    }
   
    public func numberOfSections(in tableView: UITableView) -> Int{
        return ((dataStruct?.arrayOfSources.count)! - 1)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 100
    }
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 30
    }
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
        return 10
    }
    
  
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "verticalCell")
        cell?.layer.cornerRadius = 20
        cell?.selectionStyle = UITableViewCellSelectionStyle.none
       // cell?.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.06)
        cell?.layer.masksToBounds = true
        return cell!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.verticalTableView.delegate = self
        self.verticalTableView.dataSource  = self
        self.verticalTableView.backgroundColor = .none
        self.verticalTableView.showsVerticalScrollIndicator = false
    }
    
    func configure(dataStruct: subscribedDataStruct){
        self.dataStruct = dataStruct
    }
   
}
