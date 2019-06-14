//
//  ViewController.swift
//  helloWorld
//
//  Created by Brendon M Lapp on 2019-01-11.
//  Copyright © 2019 Brendon M Lapp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var enterNameText: UITextField!
    @IBOutlet weak var labelNameText: UILabel!
    @IBAction func clickMeButton(_ sender: Any) {
        if let name = enterNameText.text {
            labelNameText.text = "hello, \(name)"
        }
        else
        {
            labelNameText.text = "You're bad"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

