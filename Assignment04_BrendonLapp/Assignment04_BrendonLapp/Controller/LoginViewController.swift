//
//  LoginViewController.swift
//  Assignment04_BrendonLapp
//
//  Created by Brendon M Lapp on 2019-04-08.
//  Copyright © 2019 Brendon M Lapp. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .portrait
        } else {
            return .all
        }
    }
    
    @IBAction func loginAction(_ sender: Any) {
        if (userNameTextField.text == "")
        {
            alertPopup(message: "Must enter a Username")
        }
        else if (passwordTextField.text == "")
        {
            alertPopup(message: "Must enter a Password")
        }
        else
        {
            let defaults = UserDefaults.standard
            
            if (userNameTextField.text != defaults.string(forKey: "username_preference"))
            {
                alertPopup(message: "Username does not match")
            }
            else if (passwordTextField.text != defaults.string(forKey: "password_preference"))
            {
                alertPopup(message: "Password does not match")
            }
            else
            {
                performSegue(withIdentifier: "segueToList", sender: self)
                //perform the log in
            }
        }
    }
    
    func alertPopup(message:String)
    {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func GoToCreate(_ sender: Any) {
        performSegue(withIdentifier: "segueToCreate", sender: self)
    }
    
    @IBAction func onTapControl(_ sender: Any) {
        userNameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
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
