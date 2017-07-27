//
//  FeedbackSubjectTableViewController.swift
//  Cursometr
//
//  Created by test on 22.07.17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

protocol ChoosedSubjectDelegate{
    func subject(label: String, row: Int)
}

class FeedbackSubjectTableViewController: UITableViewController {
    
    var indexSubject: Int!
    var delegate: ChoosedSubjectDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 36/255, green: 37/255, blue: 43/255, alpha: 1)
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        let indexPath = IndexPath(row: indexSubject, section: 0)
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: .bottom)
        self.tableView.delegate?.tableView!(self.tableView, didSelectRowAt: indexPath)
        print(indexSubject)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return CGFloat(64)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    
   
   override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vw = UIView()
        vw.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 48)
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: vw.frame.width, height: 48))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "Choose subject"
        label.font = UIFont.systemFont(ofSize: 36, weight: UIFontWeightHeavy)
        vw.addSubview(label)
        label.topAnchor.constraint(equalTo: vw.topAnchor, constant: -24).isActive = true
        label.leftAnchor.constraint(equalTo: vw.leftAnchor, constant: 16).isActive = true
        label.rightAnchor.constraint(equalTo: vw.rightAnchor, constant: 0).isActive = true
        label.bottomAnchor.constraint(equalTo: vw.bottomAnchor, constant: 0).isActive = true
        vw.backgroundColor = .none
        return vw
    }
   
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.tableView.deselectRow(at: IndexPath(row: indexSubject, section: 0), animated: true)
        self.tableView.delegate?.tableView!(self.tableView, didDeselectRowAt: IndexPath(row: indexSubject, section: 0) )
        indexSubject = indexPath.row
        
        print(indexPath.row, " : ", indexSubject)
        var cell = (tableView.cellForRow(at: indexPath) as? FeedbackSubjectTableViewCell)!
            cell.subjectLabel.textColor = .white
            cell.checkImage.isHidden = false
            delegate.subject(label: cell.subjectLabel.text!, row: indexPath.row)
        
       

    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        var cell = (tableView.cellForRow(at: indexPath) as? FeedbackSubjectTableViewCell)!
        cell.subjectLabel.textColor = .gray
        cell.checkImage.isHidden = true
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? FeedbackSubjectTableViewCell
        cell?.configure(rowNumber: indexPath.row)
        cell?.selectionStyle = .none
        return cell!
    }
    
   
  /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
