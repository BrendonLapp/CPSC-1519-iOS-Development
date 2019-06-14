//
//  ViewController.swift
//  keyboardDismissDemo
//
//  Created by Brendon M Lapp on 2019-01-16.
//  Copyright © 2019 Brendon M Lapp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!

    @IBAction func submitButton(_ sender: UIButton) {
        let msg = self.nameTextField.text!.isEmpty
            ? "You can breathe easy, everything went OK."
            : "You can breathe easy, \(self.nameTextField.text!),"
            + " everything went OK."
        let controller2 = UIAlertController(
            title:"Something Was Done",
            message: msg, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Phew!",
                                         style: .cancel, handler: nil)
        controller2.addAction(cancelAction)
        self.present(controller2, animated: true, completion: nil)
    }
    
    @IBAction func textfieldDoneEditing(_ sender: UITextField) {
        sender.resignFirstResponder()
        //nameTextField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTapControl(_ sender: Any) {
        nameTextField.resignFirstResponder()
        ageTextField.resignFirstResponder()
    }
    
    @IBAction func textFieldDoneEditing(sender: UITextField) {
        sender.resignFirstResponder()
    }
}
