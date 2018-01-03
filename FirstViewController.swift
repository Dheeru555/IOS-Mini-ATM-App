//
//  FirstViewController.swift
//  MiniATM
//
//  Created by Devineni, Sai Dheeraj on 7/8/17.
//  Copyright © 2017 Devineni, Sai Dheeraj. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    var Model : AtmModeler!
    var trans = AtmDepositModeler()
    
    
    @IBOutlet weak var viewer: UIView!
    @IBOutlet weak var OperationSeg: UISegmentedControl!
    
    @IBOutlet weak var Depositlabel: UILabel!
    @IBOutlet weak var Deposit: UITextField!
    
    
    @IBOutlet weak var Withdrawlabel: UILabel!
    @IBOutlet weak var Withdraw: UITextField!
    
    @IBOutlet weak var SubmitLabel: UIButton!
    
    @IBOutlet weak var Checklabel: UILabel!
    
    
    
    var depstamt : Double!
    var withdrawamt : Double!
    var balAmt : Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Withdrawlabel.isHidden = true
        Withdraw.isHidden = true
        Checklabel.isHidden = true
        
        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func OperationSegFunc(_ sender: Any) {
        if(OperationSeg.selectedSegmentIndex == 0)
        {
            Withdrawlabel.isHidden = true
            Withdraw.isHidden = true
            Checklabel.isHidden = true
            Depositlabel.isHidden = false
            Deposit.isHidden = false
            
        }
        else if(OperationSeg.selectedSegmentIndex == 1)
        {
            Depositlabel.isHidden = true
            Deposit.isHidden = true
            Checklabel.isHidden = true
            Withdrawlabel.isHidden = false
            Withdraw.isHidden = false

        }
        else
        {
            Withdrawlabel.isHidden = true
            Withdraw.isHidden = true
            Depositlabel.isHidden = true
            Deposit.isHidden = true
            SubmitLabel.isHidden = false
            
        }
    }
    
    
   
    @IBAction func SubmitChange(_ sender: Any) {
        
        if(OperationSeg.selectedSegmentIndex == 0)
        {
            
            
            if let chk = Double(Deposit.text!) as? Double
            {
                if(Double(Deposit.text!)! < 0)
                {
                    Deposit.text = ""
                    let alert = UIAlertController(title: "Invalid Amount entered", message:"Please enter correct amount" ,preferredStyle : .alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                }
                else
                {
                    depstamt = Double(Deposit.text!)!
                    Model = AtmModeler(depstamt,0,NSDate(),"Deposit")
                    var temp1 = Model.depositFunc()
                    Checklabel.text = "your deposited amt : \(depstamt!) and bal is \(temp1)"
                    balAmt = temp1
                    Checklabel.isHidden = false
                    trans.addTransaction(Model)
                    // print("deposit: trans.transactionCount()")
                    Deposit.text = ""
                }

            }
            else
            {
                let alert = UIAlertController(title: "Invalid Amount entered", message:"Please enter correct amount" ,preferredStyle : .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
                
            }
            }
        else if(OperationSeg.selectedSegmentIndex == 1)
        {
           
            if let chk1 = Double(Withdraw.text!) as? Double
            {
            if Double(Withdraw.text!)! < 0 || Double(Withdraw.text!)! > balAmt
            {
                Withdraw.text = ""
                let alert = UIAlertController(title: "Invalid Amount entered", message:"Please enter valid amt and your current bal is \(balAmt)" ,preferredStyle : .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
            else
            {
            withdrawamt = Double(Withdraw.text!)!
            Model = AtmModeler(0,withdrawamt,NSDate(),"Withdraw")
            var temp2 = Model.withdrawFunc()
            Checklabel.text = "Your withdraw amt is : \(withdrawamt!) and bal is \(temp2)"
            balAmt = temp2
            Checklabel.isHidden = false
            trans.addTransaction(Model)
               // print("withdrwa: trans.transactionCount()")
                Withdraw.text = ""
            }
            }
            else
            {
                let alert = UIAlertController(title: "Invalid Amount entered", message:"Please enter valid amt and your current bal is \(balAmt)" ,preferredStyle : .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        else
        {
            
            Checklabel.text = "Your main balance is : \(balAmt)"
            Checklabel.isHidden = false

            Model = AtmModeler(0,0,NSDate(),"Balance Inq")
            trans.addTransaction(Model)
            trans.balCheck(balAmt)
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
                if let transpart =
                    segue.destination as? TransTabViewController
                {
                    
                    transpart.trans = trans
                }
        
    }
    
    
    @IBAction func adder(segue:UIStoryboardSegue)
    {
        if segue.identifier == "MainSegue"
        {
            dismiss(animated: true, completion: nil)
            
        }
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
