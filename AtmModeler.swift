//
//  AtmModeler.swift
//  MiniATM
//
//  Created by Devineni, Sai Dheeraj on 7/8/17.
//  Copyright © 2017 Devineni, Sai Dheeraj. All rights reserved.
//

import Foundation

var bal : Double = 0.0
class AtmModeler
{
    
    var deposit : Double
    var withdraw : Double
    var date : NSDate
    var type : String
    
    init(_ deposit : Double , _ withdraw : Double, _ date : NSDate, _ type : String)
        {
            self.deposit = deposit
            self.withdraw = withdraw
            self.date = date
            self.type = type
        }
    
    
    init()
    {
        deposit=0.0
        withdraw=0.0
        date=NSDate()
        type=""
    }
    
    
    func depositFunc()->Double
    {
        print(date)
        bal = bal + deposit
        
        return bal
    }
    
    
    func withdrawFunc()->Double
    {
        print(date)
        bal = bal - withdraw
        
        return bal
    }
    
}

