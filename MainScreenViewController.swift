//
//  MainScreenViewController.swift
//  Cursometr
//
//  Created by test on 10.07.17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, FeedbackDelegate, QuotationsListDelegate{

    @IBOutlet weak var horizontalQuotationsCollection: UICollectionView!
    
    var colArray:[subscribedDataStruct] = []
    var allCurrenciesWithSources:[CurrencyWithSources] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        WorkWithServer.authorizationStart(onSuccess: { self.tableData()})
        self.horizontalQuotationsCollection.delegate = self
        self.horizontalQuotationsCollection.dataSource = self
        self.horizontalQuotationsCollection.isPagingEnabled = true
        self.horizontalQuotationsCollection.showsHorizontalScrollIndicator = false
        
    configure()
    }
    
    func leaveFeedback(){
       performSegue(withIdentifier: "FeedbackSegue", sender: self)
    }
    
    func showQuotationsList(){
        performSegue(withIdentifier: "QuotationsList", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "QuotationsList"{
            let destinationVC = segue.destination as! SubscribedQuotationsTableViewController
            destinationVC.currencies = allCurrenciesWithSources
        }
    }
    func configure(){
    }
    
    func tableData(){
        WorkWithServer.getSubscribedData() { (results:[subscribedDataStruct]) in
            self.colArray = results
            print(results)
        DispatchQueue.main.async {
                self.horizontalQuotationsCollection.reloadData()
            }
        WorkWithServer.getAllDataFromServer(OnSuccess: { ( results:[CurrencyWithSources]) in
            self.allCurrenciesWithSources = results
            print(results)
                DispatchQueue.main.async {
                    self.horizontalQuotationsCollection.reloadData()
                }
        })
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return colArray.count
        
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ResourcesCollectionViewCell
        cell.configure(dataStruct: colArray[indexPath.item])
        cell.headerOfCurrencyView.delegateFeedback = self
        cell.headerOfCurrencyView.delegateQuotationsList = self
        cell.backgroundColor = .none
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        return size
    }

}
