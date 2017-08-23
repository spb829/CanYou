//
//  SettingGenderTableViewController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 23..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit

class SettingGenderTableViewController: BaseTableViewController {
    var currentUser = DataController.sharedDataController.currentUser
    
    @IBOutlet var maleCell: UITableViewCell!
    @IBOutlet var femaleCell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setCheckmark()
    }
    
    func setCheckmark() {
        switch currentUser.gender {
        case "남":
            maleCell.accessoryType = .checkmark
            femaleCell.accessoryType = .none
        case "여":
            maleCell.accessoryType = .none
            femaleCell.accessoryType = .checkmark
        default:
            maleCell.accessoryType = .checkmark
            femaleCell.accessoryType = .none
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            currentUser.gender = "남"
        case 1:
            currentUser.gender = "여"
        default:
            break
        }
        
        setCheckmark()
    }
}
