//
//  secondViewController.swift
//  chapter06MultiViewDemo02
//
//  Created by Brendon M Lapp on 2019-02-06.
//  Copyright © 2019 Brendon M Lapp. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {
    
    var backgroundColor: UIColor = UIColor.brown
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = backgroundColor
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var rSlider: UISlider!
    @IBOutlet weak var rLabel: UILabel!
    @IBAction func rSliderReader(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        rLabel.text = "\(currentValue)"
    }
    
    @IBOutlet weak var gSlider: UISlider!
    @IBOutlet weak var gLabel: UILabel!
    @IBAction func gSliderReader(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        gLabel.text = "\(currentValue)"
    }
    
    
    @IBOutlet weak var bSlider: UISlider!
    @IBOutlet weak var bLabel: UILabel!
    @IBAction func bSliderReader(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        bLabel.text = "\(currentValue)"
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
