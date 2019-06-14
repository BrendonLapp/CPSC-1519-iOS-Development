//
//  ViewController.swift
//  timerDemo
//
//  Created by Brendon M Lapp on 2019-01-23.
//  Copyright © 2019 Brendon M Lapp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var counter = 0
    var timer: Timer?
    
    @IBOutlet weak var myLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, {
            timer in
            self.counter += 1
            self.myLabel.text = "\(self.counter)"
        })
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

