//
//  CreateAccountViewController.swift
//  Assignment04_BrendonLapp
//
//  Created by Brendon M Lapp on 2019-04-08.
//  Copyright © 2019 Brendon M Lapp. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var yourNameTextField: UITextField!
    @IBOutlet weak var newUserName: UITextField!
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var newPasswordConfirm: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .portrait
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerAccount(_ sender: Any) {
        if (newUserName.text == "")
        {
            alertPopup(message: "Must enter a Username")
            //tell them user name is empty
        }
        else if (newPassword.text == "" || newPasswordConfirm.text == "")
        {
            alertPopup(message: "Must enter a password in the password fields")
            //tell them passwords are empty
        }
        else if (newPassword.text != newPasswordConfirm.text)
        {
            alertPopup(message: "Passwords do not match")
            //tell them passwords dont match
        }
        else
        {
            //save the defaults and send back to the log in page
            let defaults = UserDefaults.standard
            
            defaults.set(newUserName.text, forKey: "username_preference")
            defaults.set(newPasswordConfirm.text, forKey: "password_preference")
            defaults.set(yourNameTextField.text, forKey: "name_preference")
            
            alertPopup(message: "Account created, please log in")
            
            performSegue(withIdentifier: "segueToLogin", sender: self)
        }
    }
    
    
    func alertPopup(message:String)
    {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        performSegue(withIdentifier: "segueToLogin", sender: self)
    }
    
    @IBAction func onTapControl(_ sender: Any) {
        yourNameTextField.resignFirstResponder()
        newUserName.resignFirstResponder()
        newPassword.resignFirstResponder()
        newPasswordConfirm.resignFirstResponder()
    }
    
    @IBAction func doneEditing(_ sender: UITextField) {
        sender.resignFirstResponder()
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
