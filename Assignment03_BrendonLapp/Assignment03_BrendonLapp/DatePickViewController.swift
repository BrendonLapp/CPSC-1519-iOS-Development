//
//  DatePickViewController.swift
//  Assignment03_BrendonLapp
//
//  Created by Brendon M Lapp on 2019-03-22.
//  Copyright © 2019 Brendon M Lapp. All rights reserved.
//

import UIKit

class DatePickViewController: UIViewController {

    @IBOutlet weak var getTask: UITextField!
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    var taskValue: String!
    var someDateString: String!
    var progressValue = 0.0
    var taskBool = false
    var datebool = false
    var taskEntries = [[String : String]]()
    
    @IBOutlet weak var progressOutlet: UIProgressView!
    
    //This method will lock the current view controller to only orientate in portrait.
    //I put it here to ensure that a user can not go into landscape mode on this view
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .portrait
        } else {
            return .all
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myDatePicker.datePickerMode = .date
        
        self.progressOutlet.progress = Float(progressValue)
        getDateFromPicker(myDatePicker)
        //self.perform(#selector(updateProgress), with: nil, afterDelay: 0.2)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func updateProgress() {
        progressValue = progressValue + 0.4
        self.progressOutlet.progress = Float(progressValue)
    }
    
    @IBAction func saveTask(_ sender: Any) {
        if (getTask?.text == "")
        {
            let alert = UIAlertController(title: "Must input a task", message: "You must input a task in the text field", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if (taskBool == false) //To stop the progress view from updating multiple times if the button keeps getting hit
        {
            taskBool = true
            taskValue = (getTask?.text)!
            updateProgress()
        }
    }
    
    @IBAction func saveDate(_ sender: Any) {
        getDateFromPicker(myDatePicker)
        if (datebool == false) //To stop the progress view from updating multiple times if the button keeps getting hit
        {
            datebool = true
            updateProgress()
        }
    }
    
    @IBAction func getDateFromPicker(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, YYYY"
        someDateString = dateFormatter.string(from: sender.date)
    }
    
    @IBAction func onTapControl(_ sender: Any) {
        getTask.resignFirstResponder()
    }
    
    @IBAction func doneEditing(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func GoToNextScreen(_ sender: Any) {
        if (getTask?.text == "")
        {
            let alert = UIAlertController(title: "Must input a task", message: "You must input a task in the text field", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            performSegue(withIdentifier: "segueToSlider", sender: self)
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sliderVC: SliderViewController = segue.destination as! SliderViewController
        sliderVC.hiddenTask = taskValue
        sliderVC.hiddenDate = someDateString
        sliderVC.progressValue = progressValue
        sliderVC.taskEntries = taskEntries
    }
}
