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

    
    var dataStruct: subscribedDataStruct!
    
    
    @IBOutlet weak var verticalTableView: UITableView!

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (self.dataStruct.sources[section].ranges.count)
    }
    
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vw = HeaderLabelView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 34))
        vw.configure(labelText: (dataStruct.sources[section].name))
        return vw
    }
   
    public func numberOfSections(in tableView: UITableView) -> Int{
        return (dataStruct.sources.count)
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
        cell?.configure(sourceData: (dataStruct?.sources[indexPath.section])!, index: indexPath.item)
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
        self.backgroundColor = .none
        
    }
    
    func configure(dataStruct: subscribedDataStruct){
        self.dataStruct = dataStruct
        headerOfCurrencyView.currentQuotationLabel.text = dataStruct.name
    }
   
}
