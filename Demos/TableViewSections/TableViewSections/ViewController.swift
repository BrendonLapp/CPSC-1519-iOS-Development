//
//  ViewController.swift
//  TableViewSections
//
//  Created by Brendon M Lapp on 2019-03-06.
//  Copyright © 2019 Brendon M Lapp. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    
    let sectionsTableIdentifier = "SectionsTableIdentifier"
    var names: [String: [String]]!
    var keys: [String]!

    @IBOutlet weak var tabelView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tabelView.register(UITableViewCell.self, forCellReuseIdentifier: sectionsTableIdentifier)
        
        let path = Bundle.main.path(forResource: "NHLTeams-Divisions", ofType: "plist")
        
        let namesDict = NSDictionary(contentsOfFile: path!)
        names = namesDict as! [String: [String]]
        keys = (namesDict!.allKeys as! [String]).sorted()
        
        tabelView.dataSource = self //not setting this will cause it to not populate the tableview
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Table View Data Source Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = keys[section]
        let nameSection = names[key]!
        return nameSection.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keys[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: sectionsTableIdentifier, for: indexPath)
            as UITableViewCell
        let key = keys[indexPath.section]
        let nameSection = names[key]!
        cell.textLabel?.text = nameSection[indexPath.row]
        
        return cell
    }
    
    

}

