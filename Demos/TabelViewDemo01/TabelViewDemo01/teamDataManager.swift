//
//  teamDataManager.swift
//  TabelViewDemo01
//
//  Created by Brendon M Lapp on 2019-03-04.
//  Copyright © 2019 Brendon M Lapp. All rights reserved.
//

//This is the MODEL part of MVC in iOS development
import Foundation

class teamDataManager
{
    //set up an array to hold the data from the plist
    var nhlTeamNames = [String]()
    
    //the init function starts the process of grabbing the url of the plist
    init() {
        //grab the url inside an if/else
        if let url = Bundle.main.url(forResource: "nhlteams", withExtension: "plist")
        {
            do
            {
                let teamData = try Data(contentsOf: url)
                
                //2nd do catch doesnt have to exist, but it lets there be different error messages
                do
                {
                    nhlTeamNames = try PropertyListSerialization.propertyList(from: teamData, options: [], format: nil) as! [String]
                }
                catch
                {
                    print("Error binding data to the file")
                }
            }
            catch
            {
                print("Error reading from file")
            }
            //wrong way to do it
            //let teamData = try! Data(contentsOf: url) //get the data and have it in a Data data type that can hold any type of data
            //nhlTeamNames = try! PropertyListSerialization.propertyList(from: teamData, options: [], format: nil) as! [String] //grab the data from the Data type in line previous line and put into an array
        }
        else
        {
            print("Plist file does not exist")
        }
    }
}
