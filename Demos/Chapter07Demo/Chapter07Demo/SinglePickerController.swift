//
//  SinglePickerController.swift
//  Chapter07Demo
//
//  Created by Brendon M Lapp on 2019-02-25.
//  Copyright © 2019 Brendon M Lapp. All rights reserved.
//

import UIKit

class SinglePickerController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var dayLabel: UILabel!
    var DayArray:[String] = Array()
    var DaySelected:String = "Monday"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DayArray.append("Sunday")
        DayArray.append("Monday")
        DayArray.append("Tuesday")
        DayArray.append("Wednesday")
        DayArray.append("Thursday")
        DayArray.append("Friday")
        DayArray.append("Saturday")
        
        picker.delegate = self
        picker.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return DayArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return DayArray[row]
    }
    
    func  pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        DaySelected = DayArray[picker.selectedRow(inComponent: 0)]
    }
    
    @IBAction func pickDayButton(_ sender: UIButton) {
        dayLabel.text = DaySelected
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
