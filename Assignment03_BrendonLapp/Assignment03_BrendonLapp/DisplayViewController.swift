//
//  DisplayViewController.swift
//  Assignment03_BrendonLapp
//
//  Created by Brendon M Lapp on 2019-03-22.
//  Copyright © 2019 Brendon M Lapp. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController {

    var hiddenDate: String?
    var hiddenTask: String?
    var progressValue: Double = 0.0
    var categoryName: String?
    
    var taskEntries = [[String : String]]()
    
    var trackSave = false
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
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
        
        categoryLabel.text = categoryName
        taskLabel.text = hiddenTask
        dateLabel.text = hiddenDate

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveTask(_ sender: Any) {
        if (trackSave == false)
        {
            trackSave = true
            let newTask = ["task" : hiddenTask, "cat" : categoryName, "date" : hiddenDate]
            
            taskEntries.append(newTask as! [String : String])
        }
    }
    
    @IBAction func goToList(_ sender: Any) {
        if (trackSave == false)
        {
            let alert = UIAlertController(title: "You should save first", message: "Your new task has not been saved. Please save before continuing.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            performSegue(withIdentifier: "segueToList", sender: self)
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let listVC: TableViewController = segue.destination as! TableViewController
        listVC.taskEntries = taskEntries
        
    }

}
