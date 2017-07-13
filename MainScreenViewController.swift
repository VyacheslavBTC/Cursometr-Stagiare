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
        WorkWithServer.authorizationStart(onSuccess: {})
        WorkWithServer.getSubscribedData() { (results:[subscribedDataStruct]) in
            self.colArray = results
            DispatchQueue.main.async {
                self.horizontalQuotationsCollection.reloadData()
            }
        }
        horizontalQuotationsCollection.delegate = self
        horizontalQuotationsCollection.dataSource = self
        self.horizontalQuotationsCollection.isPagingEnabled = true
        self.horizontalQuotationsCollection.showsHorizontalScrollIndicator = false
        //self.horizontalQuotationsCollection.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.85)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return colArray.count
    }
    

        // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ResourcesCollectionViewCell
        cell.configure(dataStruct: colArray[indexPath.section])
     
        cell.backgroundColor = .none
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        return size
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
