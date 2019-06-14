//
//  HomeViewController.swift
//  Chapter12Demo
//
//  Created by Brendon M Lapp on 2019-03-25.
//  Copyright © 2019 Brendon M Lapp. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var proImageView: UIImageView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var rememberSwitch: UISwitch!
    @IBOutlet weak var loginOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let defaults = UserDefaults.standard
        if defaults.bool(forKey: "rememberMe_Preference") {
            userNameTextField.text = defaults.string(forKey: "logonName_preference") as? String
            passwordTextField.text = defaults.string(forKey: "loginPassword_Preference") as? String
            rememberSwitch.isOn = defaults.bool(forKey: "rememberMe_Preference")
            
            loginOutlet.sendActions(for: .allTouchEvents)
            
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginButton(_ sender: Any) {
        //if userNameTextField.text != "user1519" && passwordTextField.text != "Password1519"
        //{
            //dont let them log in
        //}
        //else
        //{
            //do the log in
            //performSegue(withIdentifier: "homeToTable", sender: self)
        //}
        
        var validCredentials = false
        if let username = userNameTextField.text {
            if let password = passwordTextField.text {
                if username == "user1519" && password == "Password1519" {
                    validCredentials = true
                    if rememberSwitch.isOn {
                        //send the tracking to the settings bundle
                        let defaults = UserDefaults.standard
                        defaults.set(username, forKey: "logonName_preference")
                        defaults.set(password, forKey: "loginPassword_Preference")
                        defaults.set(rememberSwitch.isOn, forKey: "rememberMe_Preference")
                    }
                }
            }
        }
        
        if (validCredentials == false) {
            //present the table view controller
            performSegue(withIdentifier: "homeTotable", sender: self)
        }
        else
        {
            //display an alert saying username or password is incorrect
        }
        
    }
    
    @IBAction func rememberSwitchAction(_ sender: Any) {
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
