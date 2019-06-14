//
//  ExpanseFormViewController.swift
//  PersistenceDemo01
//
//  Created by Brendon M Lapp on 2019-04-03.
//  Copyright © 2019 Brendon M Lapp. All rights reserved.
//

import UIKit

class ExpanseFormViewController: UIViewController {
    
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var datePickerTextField: UIDatePicker!
    
    @IBAction func DatePicker(_ sender: Any) {
    }
    let expenseDataManager = ExpanseManager()
    
    @IBAction func cancel (segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func save (segue: UIStoryboardSegue) {
        let expanseFormVC = segue.source as! ExpanseFormViewController
    }


    override func viewDidLoad() {
        super.viewDidLoad()

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
