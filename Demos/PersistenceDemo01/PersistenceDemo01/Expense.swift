//
//  Expense.swift
//  PersistenceDemo01
//
//  Created by Brendon M Lapp on 2019-04-03.
//  Copyright © 2019 Brendon M Lapp. All rights reserved.
//

import UIKit

class Expense: NSObject, NSCoding {
    
    var expenseID = ""
    var expenseDescription = "" //Description is a reserved word in NSObject
    var expenseDate = Date()
    var amount = 0.00
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(expenseID, forKey: "expenseID")
        aCoder.encode(expenseDescription, forKey: "expenseDescription")
        aCoder.encode(expenseDate, forKey: "expenseDate")
        aCoder.encode(amount, forKey: "amount")
    }
    
    override init() {
        //this overides the default initializer
    }
    
    required init?(coder aDecoder: NSCoder) {
        expenseID = aDecoder.decodeObject(forKey: "expenseID") as! String
        expenseDescription = aDecoder.decodeObject(forKey: "expenseDescription") as! String
        expenseDate = aDecoder.decodeObject(forKey: "expenseDate") as! Date
        amount = aDecoder.decodeObject(forKey: "amount") as! Double
    }
    

}
