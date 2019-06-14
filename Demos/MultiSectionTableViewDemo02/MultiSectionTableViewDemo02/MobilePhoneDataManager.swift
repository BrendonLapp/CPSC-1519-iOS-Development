//
//  MobilePhoneDataManager.swift
//  MultiSectionTableViewDemo01
//
//  Created by Brendon M Lapp on 2019-03-11.
//  Copyright © 2019 Brendon M Lapp. All rights reserved.
//

import Foundation

//this class is going to read the contents of the plist file

class MobilePhoneDataManager {
    var mobilePhoneDict: [String: [String]]!
    var manufacturers: [String]!
    
    init() {
        if let url = Bundle.main.url(forResource: "mobile-phones", withExtension: "plist") {
            do {
                let mobilePhoneData = try Data(contentsOf: url)
                mobilePhoneDict = try PropertyListSerialization.propertyList(from: mobilePhoneData, options: [], format: nil) as! [String: [String]]
                manufacturers = Array(mobilePhoneDict.keys).sorted()
            }
            catch {
                print("Error reading from plist file")
            }
        }
    }
    
    //Added in this helper method to be able to sort it based on a manufactuer name
    func manufacturerPhones(manufacturerName name: String) -> [String] {
        return mobilePhoneDict[name]!
    }
    
}

