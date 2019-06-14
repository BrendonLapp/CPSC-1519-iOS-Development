//
//  PostManager.swift
//  Assignment04_BrendonLapp
//
//  Created by Brendon M Lapp on 2019-04-10.
//  Copyright © 2019 Brendon M Lapp. All rights reserved.
//

import Foundation

class PostManager {
    
    let postURl : URL = {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask)
        return (urls.first?.appendingPathComponent("posts.archive"))!
    }()
    
    var posts = [Post]()
    
    func WriteToFile() {
        if !NSKeyedArchiver.archiveRootObject(posts, toFile: postURl.path)
        {
            print("Succedded to write to the file at path: \(postURl.path)")
        }
        else
        {
            print("Failed to write to file")
        }
    }
    
    init() {
        if let archivedItems = NSKeyedUnarchiver.unarchiveObject(withFile: postURl.path) as? [Post]
        {
            posts = archivedItems
        }
    }
    
    func AddNewPost (_ newPost: Post)
    {
        newPost.postID = UUID().uuidString
        posts.append(newPost)
        
        WriteToFile()
    }
    
    func UpdatePost (_ existingPost: Post, at Index: Int)
    {
        posts[Index] = existingPost
        WriteToFile()
    }
    
    func DeletePost(at Index: Int) {
        posts.remove(at: Index)
        WriteToFile()
    }
    
}
