//
//  MainScreenViewController.swift
//  Cursometr
//
//  Created by test on 10.07.17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var horizontalQuotationsCollection: UICollectionView!
    
    var colArray:[subscribedDataStruct] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WorkWithServer.authorizationStart(onSuccess: { self.tableData()})
        self.horizontalQuotationsCollection.delegate = self
        self.horizontalQuotationsCollection.dataSource = self
        self.horizontalQuotationsCollection.isPagingEnabled = true
        self.horizontalQuotationsCollection.showsHorizontalScrollIndicator = false
    }
    
    func tableData(){
        WorkWithServer.getSubscribedData() { (results:[subscribedDataStruct]) in
            self.colArray = results
            DispatchQueue.main.async {
                self.horizontalQuotationsCollection.reloadData()
            }
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
        cell.backgroundColor = .none
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        return size
    }

}
