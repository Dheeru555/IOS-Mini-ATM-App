//
//  AtmDepositModeler.swift
//  MiniATM
//
//  Created by Devineni, Sai Dheeraj on 7/8/17.
//  Copyright © 2017 Devineni, Sai Dheeraj. All rights reserved.
//

import Foundation
class AtmDepositModeler
{
    var transactions = Array<AtmModeler>()
    
    var mainBal : Double = 0.0

    
    func contactAtIndex(_ id : Int) -> AtmModeler
    {
        return transactions[id]
    }
    
//    func deleteContactAtIndex(_ id : Int)
//    {
//        contacts.remove(at : id)
//    }
    
    func transactionCount() -> Int{
        return transactions.count
    }
    
    func addTransaction(_ t: AtmModeler)
    {
        transactions.append(AtmModeler(t.deposit,t.withdraw,t.date,t.type))
    }
    
    func balCheck(_ k : Double)
    {
        mainBal = k
    }
    
    
}
