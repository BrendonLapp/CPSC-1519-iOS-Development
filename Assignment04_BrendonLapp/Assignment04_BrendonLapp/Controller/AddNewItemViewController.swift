//
//  AddNewItemViewController.swift
//  Assignment04_BrendonLapp
//
//  Created by Brendon M Lapp on 2019-04-10.
//  Copyright © 2019 Brendon M Lapp. All rights reserved.
//

import UIKit

class AddNewItemViewController: UIViewController {

    var manager = PostManager()
    
    @IBOutlet weak var PostName: UITextField!
    @IBOutlet weak var Description: UITextField!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var addImageOutlet: UIButton!
    //var imagePicker = UIImagePickerController()
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /* I tried to have it save an image but couldn't get it to work with nscoding
    I'm going to leave its code here for the future incase I need it. This works for opening up the
    photos app and letting you pick a photo to view inside this app
     UIImagePickerControllerDelegate,
     UINavigationControllerDelegate
    @IBAction func addImageAction(_ sender: Any) {
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            myImage.image = image
        }
        dismiss(animated: true, completion: nil)
    }*/
    
    @IBAction func saveAction(segue: UIStoryboardSegue) {
        let listVC = segue.source as! AddNewItemViewController
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
