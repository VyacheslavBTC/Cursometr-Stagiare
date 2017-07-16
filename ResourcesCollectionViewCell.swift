//
//  ResourcesCollectionViewCell.swift
//  Cursometr
//
//  Created by test on 11.07.17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class ResourcesCollectionViewCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var headerOfCurrencyView: HeaderView!
    var dataStruct:subscribedDataStruct?
    
    @IBOutlet weak var verticalTableView: UITableView!

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        //return self.items[section].array.count
        return (self.dataStruct?.arrayOfSources[section].sourceRanges.count)!
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vw = UIView()
        vw.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 34)
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: vw.frame.width, height: 30))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = dataStruct?.arrayOfSources[section].sourceName
        label.textColor = .white
        label.font = label.font.withSize(22)
        //label.font = UIFont.boldSystemFont(ofSize: 22)
        vw.addSubview(label)
        label.topAnchor.constraint(equalTo: vw.topAnchor, constant: -5).isActive = true
        label.leftAnchor.constraint(equalTo: vw.leftAnchor, constant: 0).isActive = true
        vw.backgroundColor = .none
        return vw
    }
   
    public func numberOfSections(in tableView: UITableView) -> Int{
        return (dataStruct?.arrayOfSources.count)!
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 81
    }
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 30
    }
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
        return 10
    }
    
  
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "verticalCell") as? VerticalResourcesTableViewCell
        
        cell?.configure(sourceData: (dataStruct?.arrayOfSources[indexPath.section])!, index: indexPath.item)
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
        headerOfCurrencyView.currentQuotationLabel.text = dataStruct.currencyName
        
        //print(self.dataStruct)
    }
   
}
