//
//  TransactionsViewController.swift
//  MiniATM
//
//  Created by Devineni, Sai Dheeraj on 7/8/17.
//  Copyright © 2017 Devineni, Sai Dheeraj. All rights reserved.
//

import UIKit

class TransactionsViewController: UIViewController {

    @IBOutlet weak var Amt: UITextField!
    @IBOutlet weak var Time: UITextField!
    @IBOutlet weak var type: UITextField!
    
    var showDet : AtmModeler!
    
    var balDet : Double = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if showDet.type == "Deposit" || showDet.type == "deposit"
        {
            Amt.text = "\(showDet.deposit)"
        }
        else if showDet.type == "Withdraw" || showDet.type == "withdraw"
        {
            Amt.text = "\(showDet.withdraw)"
        }
        else
        {
            Amt.text = "\(balDet)"
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        var todaysDate = dateFormatter.string(from: showDet.date as Date)
        
        Time.text = todaysDate
        type.text = showDet.type
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
