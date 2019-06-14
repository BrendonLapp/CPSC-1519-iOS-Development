//
//  firstViewController.swift
//  chapter06MultiViewDemo02
//
//  Created by Brendon M Lapp on 2019-02-06.
//  Copyright © 2019 Brendon M Lapp. All rights reserved.
//

import UIKit

class firstViewController: UIViewController {
    
    @IBAction func unwindToFirst(segue: UIStoryboardSegue)
    {
        
    }

    var colorName: String = "White"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonTapped(_ sender: UIButton)
    {
        colorName = sender.title(for: .normal)!
        performSegue(withIdentifier: "toSecondVCSegue", sender: self)        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC: secondViewController = segue.destination as! secondViewController
        switch colorName {
        case "Gold":
            secondVC.backgroundColor = UIColor.yellow
        case "Silver":
            secondVC.backgroundColor = UIColor.lightGray
        case "Bronze":
            secondVC.backgroundColor = UIColor.brown
        default:
            secondVC.backgroundColor = UIColor.black
        }
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
