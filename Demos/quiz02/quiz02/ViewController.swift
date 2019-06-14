//
//  ViewController.swift
//  quiz02
//
//  Created by Brendon M Lapp on 2019-02-01.
//  Copyright © 2019 Brendon M Lapp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var intEntry: UITextField!
    @IBOutlet weak var replaceLabel: UILabel!
    
    @IBAction func addToInt(_ sender: UIButton) {
        
        let myInt:Int? = Int(intEntry.text!)
        replaceLabel.text = String(myInt! + 10)
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

