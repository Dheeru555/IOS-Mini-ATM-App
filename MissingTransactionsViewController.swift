//
//  MissingTransactionsViewController.swift
//  MiniATM
//
//  Created by Devineni, Sai Dheeraj on 7/9/17.
//  Copyright © 2017 Devineni, Sai Dheeraj. All rights reserved.
//

import UIKit

class MissingTransactionsViewController: UIViewController {
    @IBOutlet weak var Amount: UITextField!
    @IBOutlet weak var Transtype: UITextField!
    
    
    
    var Misstrans : AtmModeler!
    var bal : Double = 0
    
    
    
    @IBAction func checkFunc(_ sender: UIButton) {
        if Transtype.text != "Deposit" && Transtype.text != "deposit" && Transtype.text != "Withdraw" && Transtype.text != "withdraw"
        {
            Amount.text = ""
            Transtype.text = ""
            
            
            let alert = UIAlertController(title: "Invalid details entered", message:"Please enter type as Deposit or Withdraw only" ,preferredStyle : .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            let alert = UIAlertController(title: "Valid details entered", message:"Please click on Add button" ,preferredStyle : .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if Transtype.text == "Deposit" || Transtype.text == "deposit"
        {
            Misstrans = AtmModeler(Double(Amount.text!)!,0,NSDate(),Transtype.text!)
        }
        else if Transtype.text == "Withdraw" || Transtype.text == "withdraw"
        {
            Misstrans = AtmModeler(0,Double(Amount.text!)!,NSDate(),Transtype.text!)
        }
        
    
    
   
    }

    
    

}
