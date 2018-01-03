//
//  ViewController.swift
//  MiniATM
//
//  Created by Devineni, Sai Dheeraj on 7/8/17.
//  Copyright © 2017 Devineni, Sai Dheeraj. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var pwd: UITextField!
   
    var chkpwd : String!
    
    
    @IBAction func LoggedIn(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        
        let password = defaults.value(forKey: "password")!
        
       // print(defaults.value(forKey: "password")!)
        
        chkpwd = pwd.text!
        
        if chkpwd == String(describing: password)
        {
            self .performSegue(withIdentifier: "doit", sender: self)
        }
        else
        {
            let alert = UIAlertController(title: "Wrong Credentials", message:"Please enter correct details" ,preferredStyle : .alert)
            
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pwd.delegate = self
        
        let defaults = UserDefaults.standard
        let pass = "secret"
        // store the user info
        defaults.setValue(pass, forKey: "password")
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.pwd
        {
            pwd.resignFirstResponder()
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        chkpwd = pwd.text!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

