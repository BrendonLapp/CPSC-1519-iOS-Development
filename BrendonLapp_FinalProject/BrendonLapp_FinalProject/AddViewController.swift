//
//  AddViewController.swift
//  BrendonLapp_FinalProject
//
//  Created by Brendon M Lapp on 2019-04-24.
//  Copyright © 2019 Brendon M Lapp. All rights reserved.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var incomingPost: Post? = nil
    
    let realm = try! Realm()

    @IBOutlet weak var brandTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var serialNumberTextField: UITextField!
    @IBOutlet weak var imageViewPreview: UIImageView!
    var imagePicker = UIImagePickerController()
    
    @IBOutlet var wholeView: UIView!
    
    @IBAction func saveButton(_ sender: Any) {
        
        let post = Post()
        post.Brand = brandTextField.text!
        post.Model = modelTextField.text!
        post.ModelType = typeTextField.text!
        post.SerialNumber = serialNumberTextField.text!
        
        if (imageViewPreview.image == nil)
        {
            let alert = UIAlertController(title: "Select an image", message: "You must have an image to save", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            let ImageData = UIImagePNGRepresentation(imageViewPreview.image!)
            
            let imageSize: Int = (ImageData?.count)!
            print("Image size is: \(imageSize)")
            
            //I'm not sure what the 10,000,000 is in terms of kb/mb/b but I know setting this limit will stop the upload from failing
            //Realm has a file upload size limit of 16mb
            if (imageSize >= 10000000)
            {
                let alert = UIAlertController(title: "Image too large", message: "Your image is too large", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                print("image is over 10m")
            }
            else
            {
                post.Image = ImageData! as NSData
                try! realm.write {
                    realm.add(post)
                }
            }
            
            navigationController?.popViewController(animated: true)
        }
        
        
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .portrait
        } else {
            return .all
        }
    }
    
    @IBAction func onTapControl(_ sender: Any) {
        brandTextField.resignFirstResponder()
        modelTextField.resignFirstResponder()
        typeTextField.resignFirstResponder()
        serialNumberTextField.resignFirstResponder()
    }
    
    @IBAction func doneEditing(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wholeView.backgroundColor = UIColor.lightGray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func uploadImageButton(_ sender: Any) {
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            imageViewPreview.image = image
        }
        dismiss(animated: true, completion: nil)
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
