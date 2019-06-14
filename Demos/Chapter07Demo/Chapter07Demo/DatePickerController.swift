//
//  DatePickerController.swift
//  Chapter07Demo
//
//  Created by Brendon M Lapp on 2019-02-25.
//  Copyright © 2019 Brendon M Lapp. All rights reserved.
//

import UIKit

class DatePickerController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var DateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pickDateButton(_ sender: UIButton) {
        datePicker.datePickerMode = UIDatePickerMode.date
        var dateFormatterr = DateFormatter()
        dateFormatterr.dateFormat = "MMM dd yyyy"
        var selectedDate = dateFormatterr.string(from: datePicker.date)
        
        DateLabel.text = selectedDate
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
