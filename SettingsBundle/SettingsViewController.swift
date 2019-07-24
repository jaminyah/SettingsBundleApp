//
//  SettingsViewController.swift
//  SettingsBundle
//
//  Created by macbook on 7/18/19.
//  Copyright © 2019 jaminya. All rights reserved.
//
//  Reference:
//  https://stackoverflow.com/questions/14077431/register-default-settings-from-the-settings-bundle-plist-file

import UIKit

class SettingsViewController: UITableViewController {
    
    let cityList = ["Dallas", "Miami", "Chicago", "Denver", "Saint Louis", "Davenport", "Modesto"]
    var height: CGFloat = 54.0 {
        didSet {
            let indexPath = IndexPath(row: 0, section: 0)
            tableView.reloadRows(at: [indexPath], with: .fade)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.estimatedRowHeight = 54
        self.tableView.rowHeight = UITableView.automaticDimension
        
        NotificationCenter.default.addObserver(self, selector: #selector(adjustStackHeight(_:)), name: .didSetSwitch, object: nil)
        SettingsBundleHelper.registerSettingsBundle()
        SettingsBundleHelper.displayUserDefaults()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowCount: Int = 0
        
        switch section {
        case 0:
            rowCount = 1
        case 1:
            rowCount = cityList.count
        default:
            rowCount = 0
        }
        return rowCount
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell?
        
        switch indexPath.section {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "StackViewCell", for: indexPath) as? StackViewCell
            cell?.isUserInteractionEnabled = true
            cell?.selectionStyle = .none
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "StandardCell", for: indexPath)
            cell?.textLabel?.text = cityList[indexPath.row]
        default:
            cell = nil
        }
 
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        var cellHeight: CGFloat = 54.0
        
        switch indexPath.section {
        case 0:
            cellHeight = self.height
        case 1:
            cellHeight = 54.0
        default:
            cellHeight = 54.0
        }
        
        return cellHeight
    }
    

    @objc func adjustStackHeight(_ notification: Notification) {
        
        guard let switchState = notification.userInfo?["state"] as? String else { return }
        
        if switchState == "on" {
            self.height = 54.0
        } else if switchState == "off" {
            self.height = 120.0
        }
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
