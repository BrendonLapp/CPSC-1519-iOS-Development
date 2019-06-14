//
//  ViewController.swift
//  assignment1_BrendonLapp
//
//  Created by Brendon M Lapp on 2019-01-18.
//  Copyright © 2019 Brendon M Lapp. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var spinCount = 0
    
    var alreadyUpsideDown = false
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var chooseLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView!
    var colorArray:[String] = Array()
    var colorSelected:String = "Red"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isHidden = true
        
        colorArray.append("Red")
        colorArray.append("Cyan")
        colorArray.append("Green")
        colorArray.append("Yellow")
        colorArray.append("Magenta")
        
        pickerView.delegate = self
        pickerView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func checkSpinCount() {
        if (spinCount > 4)
        {
            
            if (alreadyUpsideDown == false)
            {
                let alert = UIAlertController(title: "Oh no!", message: "The app got a virus and is now sick! :(", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Too bad", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
            alreadyUpsideDown = true
            
            
            imageView.isHidden = false
            
            UIView.animate(withDuration: 2) {
                self.actionsLabel.transform = CGAffineTransform(rotationAngle: .pi)
                self.pickerView.transform = CGAffineTransform(rotationAngle: .pi)
                self.onOffSwitch.transform = CGAffineTransform(rotationAngle: .pi)
                self.chooseLabel.transform = CGAffineTransform(rotationAngle: .pi)
                self.countLabel.transform = CGAffineTransform(rotationAngle: .pi)
                self.switchLabel.transform = CGAffineTransform(rotationAngle: .pi)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //This method is how many columns are displayed to the user
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colorArray.count
    }
    
    //this is what the name of the row is to the user
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colorArray[row]
    }
    
    //this is picking the current row the user chose
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        colorSelected = colorArray[pickerView.selectedRow(inComponent: 0)]
    }
    
    var changeNumber = 0
    @IBOutlet weak var actionsLabel: UILabel!
    //This is doing the switch that will change the applications background color
    @IBOutlet weak var onOffSwitch: UISwitch!
    @IBAction func onSwitchChanged(_ sender: UISwitch) {
        let setting = sender.isOn
        onOffSwitch.setOn(setting, animated: true)
        if (onOffSwitch.isOn == false)
        {
            checkSpinCount()
            spinCount += 1
            changeNumber += 1
            actionsLabel.text = String(changeNumber)
            view.backgroundColor = .white
            actionsLabel.textColor = .black
            chooseLabel.textColor = .black
            countLabel.textColor = .black
            switchLabel.textColor = .black
        }
        else
        {
            spinCount += 1
            changeNumber += 1
            actionsLabel.text = String(changeNumber)
            checkSpinCount()
            if colorSelected == "Red"
            {
                view.backgroundColor = .red
            }
            else if colorSelected == "Cyan"
            {
                view.backgroundColor = .cyan
                
            }
            else if colorSelected == "Green"
            {
                view.backgroundColor = .green
            }
            else if colorSelected == "Yellow"
            {
                view.backgroundColor = .yellow
            }
            else if colorSelected == "Magenta"
            {
                view.backgroundColor = .magenta
            }
        }
    }
}

