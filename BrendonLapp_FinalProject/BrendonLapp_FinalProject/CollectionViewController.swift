//
//  CollectionViewController.swift
//  BrendonLapp_FinalProject
//
//  Created by Brendon M Lapp on 2019-04-25.
//  Copyright © 2019 Brendon M Lapp. All rights reserved.
//

import UIKit
import RealmSwift

var posts: Results<Post>!
var realm = try! Realm()

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionViewOutler: UICollectionView!
    @IBOutlet var wholeView: UIView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCollectionCell", for: indexPath as IndexPath) as! CollectionViewCell
        
        cell.backgroundColor = UIColor.white
        
        let post = posts[indexPath.row]
        
        cell.labelCollCell.text = post.Brand
        cell.modelCollCell.text = post.Model
        cell.typeCollCell.text = post.ModelType
        cell.serialNumberCollCell.text = post.SerialNumber
        
        let imageForView = UIImage(data: post.Image as Data)
        cell.imageCollCell.image = imageForView
        
        return cell
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        posts = realm.objects(Post.self)
        
        collectionViewOutler.backgroundColor = UIColor.lightGray
        wholeView.backgroundColor = UIColor.lightGray
        
        collectionViewOutler.delegate = self
        collectionViewOutler.dataSource = self
        
        reload()
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        
        let yes = UIAlertAction(title: "Yes",
                                          style: .default) { (action) in
                                            try! realm.write {
                                                realm.delete(posts[indexPath.row])
                                            }
        }
        let no = UIAlertAction(title: "No",
                                         style: .cancel) { (action) in
                                            // Respond to user selection of the action.
        }
        
        let alert = UIAlertController(title: "Delete", message: "Are you sure you want to delete this?", preferredStyle: .alert)
        alert.addAction(yes)
        alert.addAction(no)
        self.present(alert, animated: true, completion: nil)
        
        //self.selectedIndexPath = indexPath
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .portrait
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reload() {
        collectionViewOutler.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reload()
    }
    

}

class Post: Object {
    @objc dynamic var Brand = ""
    @objc dynamic var Model = ""
    @objc dynamic var ModelType = ""
    @objc dynamic var SerialNumber = ""
    @objc dynamic var Image = NSData()
}
