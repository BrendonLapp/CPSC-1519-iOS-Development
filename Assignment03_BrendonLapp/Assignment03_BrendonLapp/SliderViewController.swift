//
//  SliderViewController.swift
//  Assignment03_BrendonLapp
//
//  Created by Brendon M Lapp on 2019-03-22.
//  Copyright © 2019 Brendon M Lapp. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {

    var hiddenDate: String?
    var hiddenTask: String?
    var progressValue: Double = 0.0
    var categoryName: String = ""
    var currentValue = 0
    var wasSaved = false
    var categoryBool = false
    
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
        categoryLabel.isHidden = true
        self.progressOutlet.progress = Float(progressValue)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func categorySlider(_ sender: UISlider) {
        currentValue = Int(sender.value)
        categoryLabel.text = "\(currentValue)"
        
        if (currentValue == 0)
        {
            categoryLabel.isHidden = true
        }
        else if (currentValue == 1)
        {
            categoryLabel.isHidden = false
            categoryLabel.text = "Reviews"
        }
        else if (currentValue == 2)
        {
            categoryLabel.isHidden = false
            categoryLabel.text = "Shopping"
        }
        else if (currentValue == 3)
        {
            categoryLabel.isHidden = false
            categoryLabel.text = "Car fixes"
        }
        else if (currentValue == 4)
        {
            categoryLabel.isHidden = false
            categoryLabel.text = "Code fixes"
        }
    }
    
    @IBOutlet weak var pickACategory: UISlider!
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBAction func saveCategory(_ sender: Any) {
        categoryName = categoryLabel.text!
        wasSaved = true
        if (currentValue == 0)
        {
            let alert = UIAlertController(title: "Must select a category", message: "You must select one of the categories in the slider.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if (categoryBool == false) //To stop the progress view from updating multiple times if the button keeps getting hit
        {
            updateProgress()
            categoryBool = true
        }
        
    }
    
    @objc func updateProgress() {
        progressValue = progressValue + 0.4
        self.progressOutlet.progress = Float(progressValue)
    }
    
    @IBAction func goToDisplay(_ sender: UIButton) {
        if (currentValue == 0)
        {
            let alert = UIAlertController(title: "Must select a category", message: "You must select one of the categories in the slider.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if (wasSaved == false)
        {
            let alert = UIAlertController(title: "Must save", message: "You must save your category selection.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            performSegue(withIdentifier: "segueToDisplay", sender: self)
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let displayVC: DisplayViewController = segue.destination as! DisplayViewController
        displayVC.categoryName = categoryName
        displayVC.hiddenDate = hiddenDate
        displayVC.hiddenTask = hiddenTask
        displayVC.taskEntries = taskEntries
    }

}
