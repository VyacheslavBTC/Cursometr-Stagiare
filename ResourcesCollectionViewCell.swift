//
//  ResourcesCollectionViewCell.swift
//  Cursometr
//
//  Created by test on 11.07.17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class ResourcesCollectionViewCell: UICollectionViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    @IBOutlet weak var resourcesCollectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
   
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 15
    }
    

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath)
        cell.backgroundColor = .black
        return cell
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    func configure(){
         print("cell")
        self.resourcesCollectionView.delegate = self
        self.resourcesCollectionView.dataSource = self
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: collectionView.frame.width, height: 60)
        return size
    }
}
