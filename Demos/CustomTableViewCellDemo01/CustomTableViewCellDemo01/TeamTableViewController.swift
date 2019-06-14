//
//  TeamTableViewController.swift
//  CustomTableViewCellDemo01
//
//  Created by Brendon M Lapp on 2019-03-13.
//  Copyright © 2019 Brendon M Lapp. All rights reserved.
//

import UIKit

class TeamTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 100

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamCell", for: indexPath) as! TeamTableViewCell

        //This should have been done in a plist file instead of hard coded values
        // Configure the cell...
        if (indexPath.row == 0)
        {
            cell.TeamNameLabel.text = "Edmonton Oilers"
            cell.GPLabel.text = "69"
            cell.WLabel.text = "31"
            cell.LLabel.text = "31"
            cell.OTLLabel.text = "7"
            cell.PTSLabel.text = "69"
            cell.LogoImage.image = UIImage(named: "Oilers")
            //named because it is coming from a named file instead of a file
        }
        else if (indexPath.row == 1)
        {
            cell.TeamNameLabel.text = "Vancouver Canucks"
            cell.GPLabel.text = "69"
            cell.WLabel.text = "28"
            cell.LLabel.text = "32"
            cell.OTLLabel.text = "9"
            cell.PTSLabel.text = "65"
            cell.LogoImage.image = UIImage(named: "Canucks")
        }
        else
        {
            cell.TeamNameLabel.text = "Pitsburgh Penguins"
            cell.GPLabel.text = "70"
            cell.WLabel.text = "38"
            cell.LLabel.text = "23"
            cell.OTLLabel.text = "9"
            cell.PTSLabel.text = "85"
            cell.LogoImage.image = UIImage(named: "Penguins")
        }
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
