//
//  Post.swift
//  Assignment04_BrendonLapp
//
//  Created by Brendon M Lapp on 2019-04-10.
//  Copyright © 2019 Brendon M Lapp. All rights reserved.
//

import Foundation

class Post: NSObject, NSCoding {
    
    var postID = ""
    var postName = ""
    var postDescription = ""
    var purchaseBool = "false"
    
    func encode(with aCoder: NSCoder)
    {
        aCoder.encode(postID, forKey: "postID")
        aCoder.encode(postName, forKey: "postName")
        aCoder.encode(postDescription, forKey: "postDescription")
        aCoder.encode(purchaseBool, forKey: "purchaseBool")
    }
    
    override init() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        postID = aDecoder.decodeObject(forKey: "postID") as! String
        postName = aDecoder.decodeObject(forKey: "postName") as! String
        postDescription = aDecoder.decodeObject(forKey: "postDescription") as! String
        purchaseBool = aDecoder.decodeObject(forKey: "purchaseBool") as! String
    }
    
}
