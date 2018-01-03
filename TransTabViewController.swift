//
//  TransTabViewController.swift
//  MiniATM
//
//  Created by Devineni, Sai Dheeraj on 7/8/17.
//  Copyright © 2017 Devineni, Sai Dheeraj. All rights reserved.
//

import UIKit

class TransTabViewController: UITableViewController {

    var trans : AtmDepositModeler!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }

   override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Transactions"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if trans.transactionCount() != 0
        {
            return trans.transactionCount()
        }
        else
        {
            return 1
        }

        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if trans.transactionCount() != 0
        {
        let contactIdentifier = "TransTime"
        let cell = tableView.dequeueReusableCell(withIdentifier: contactIdentifier, for: indexPath)
        var trns = AtmModeler()
        trns = trans.contactAtIndex(indexPath.row)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        let todaysDate = dateFormatter.string(from: trns.date as Date)
        
        cell.textLabel!.text = todaysDate
            
        return cell
        }
        else
        {
            let contactIdentifier = "TransTime"
            let cell = tableView.dequeueReusableCell(withIdentifier: contactIdentifier, for: indexPath)
            
            cell.textLabel!.text = "No transactions to display"
            
            return cell
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier{
            switch id {
            case "TransView":
                if let TransDet =
                    segue.destination as? TransactionsViewController
                {
                    let selectedRow =
                        self.tableView.indexPathForSelectedRow?.row
                    TransDet.showDet = trans.contactAtIndex(selectedRow!)
                    TransDet.balDet = trans.mainBal
                }
            default:
                break
            }
        }

    }
    
    
    
   
    
    @IBAction func add(segue:UIStoryboardSegue)
    {
        if segue.identifier == "addSegue"
        {
            let dest = segue.source as! MissingTransactionsViewController
            trans.addTransaction(dest.Misstrans)
            tableView.reloadData()
            
        }
    }

}
