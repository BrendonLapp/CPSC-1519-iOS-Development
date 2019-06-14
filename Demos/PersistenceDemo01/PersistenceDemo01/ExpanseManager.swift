//
//  ExpanseManager.swift
//  PersistenceDemo01
//
//  Created by Brendon M Lapp on 2019-04-03.
//  Copyright © 2019 Brendon M Lapp. All rights reserved.
//

import Foundation

class ExpanseManager {
    let expanseURL : URL = {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask)
        return (urls.first?.appendingPathComponent("expenses.archive"))!
    }()
    
    var expenses = [Expense]()
    
    func WriteToFile() {
        if !NSKeyedArchiver.archiveRootObject(expenses, toFile: expanseURL.path)
        {
            print("Succeded to write to file")
        }
        else
        {
            print("Failed to write")
        }
    }
    
    init() {
        if let archivedItems = NSKeyedUnarchiver.unarchiveObject(withFile: expanseURL.path) as? [Expense]
        {
            expenses = archivedItems
        }
    }
    
    func AddNewExpense (_ newExpense: Expense) {
        newExpense.expenseID = UUID().uuidString
        expenses.append(newExpense)
        
        WriteToFile()
        
    }
    
    func UpdateExpense (_ existingExpense: Expense, at Index: Int) {
        expenses[Index] = existingExpense
        WriteToFile()
    }
    
    func DeleteExpense (at Index: Int) {
        expenses.remove(at: Index)
        WriteToFile()
    }
    
}
