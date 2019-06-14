//
//  ViewController.swift
//  dicegame
//
//  Created by Brendon M Lapp on 2019-01-23.
//  Copyright © 2019 Brendon M Lapp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var dice1: UIImageView!
    @IBOutlet weak var dice2: UIImageView!
    
    @IBOutlet weak var yourRollLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func callAnimate()
    {
        UIView.animate(withDuration: 1){
            self.dice1.transform = CGAffineTransform(rotationAngle: .pi)
            self.dice2.transform = CGAffineTransform(rotationAngle: .pi)
        }
    }
    
    func dieRoll()
    {
        //this could be done better by using an array of the image names
        //could also be done better by using a switch instead
        let number = arc4random_uniform(3)
        let number2 = arc4random_uniform(3)
        
        self.dice1.transform = CGAffineTransform.identity
        self.dice2.transform = CGAffineTransform.identity
        
        if (number == 0)
        {
            callAnimate()
            dice1.image = UIImage(named: "1")
        }
        else if (number == 1)
        {
            callAnimate()
            dice1.image = UIImage(named: "2")
        }
        else if (number == 2)
        {
            callAnimate()
            dice1.image = UIImage(named: "3")
        }
        else if (number == 3)
        {
            callAnimate()
            dice1.image = UIImage(named: "4")
        }
        
        if (number2 == 0)
        {
            callAnimate()
            dice2.image = UIImage(named: "1")
        }
        else if (number2 == 1)
        {
            callAnimate()
            dice2.image = UIImage(named: "2")
        }
        else if (number2 == 2)
        {
            callAnimate()
            dice2.image = UIImage(named: "3")
        }
        else if (number2 == 2)
        {
            callAnimate()
            dice2.image = UIImage(named: "4")
        }
        
        yourRollLabel.text = String((number + 1) + (number2 + 1))
        
    }
    
    @IBAction func rollButton(_ sender: UIButton) {
        dieRoll()
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        dieRoll()
    }
    
}

