//
//  FeedbackViewController.swift
//  Cursometr
//
//  Created by test on 22.07.17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController, ChoosedSubjectDelegate{

    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var addSourceButton: UIButton!
    @IBOutlet weak var leaveFeedbackLabel: UILabel!
    var indexSubject = 0;
    
    @IBAction func showChooseSubject(_ sender: Any) {
        performSegue(withIdentifier: "toChooseSubject", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
        
        let destinationVC = segue.destination as! FeedbackSubjectTableViewController
        destinationVC.indexSubject = self.indexSubject
        destinationVC.delegate = self
        
    }
    func subject(label: String, row: Int){
        indexSubject = row
        self.addSourceButton.setTitle(label,for: .normal)
    }
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: {})
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 36/255, green: 37/255, blue: 43/255, alpha: 1)
        self.leaveFeedbackLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSourceButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.layer.addSublayer(lineUnderLeaveFeedback)
        self.view.layer.addSublayer(lineUnderAddSource)
        self.addSourceButton.tintColor = UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 1)
        configure()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private lazy var lineUnderLeaveFeedback: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.1).cgColor
        return layer
    }()
    
    private lazy var lineUnderAddSource: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.1).cgColor
        return layer
    }()

    func configure(){
        
        self.leaveFeedbackLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        self.leaveFeedbackLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        self.leaveFeedbackLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 16).isActive = true
        
        self.addSourceButton.topAnchor.constraint(equalTo: self.leaveFeedbackLabel.bottomAnchor, constant: 28).isActive = true
        self.addSourceButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        self.addSourceButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant:16).isActive = true
        
        self.lineUnderLeaveFeedback.frame = CGRect(x: 16, y: self.leaveFeedbackLabel.bounds.height + 40, width: self.view.frame.width - 16, height: 1)
        
        self.lineUnderAddSource.frame = CGRect(x: 16, y: self.addSourceButton.bounds.height + 88 , width: self.view.frame.width - 16, height: 1)
    }


}
