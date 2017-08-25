//
//  SettingGenderTableViewController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 23..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit

class SettingGenderTableViewController: BaseTableViewController {
    // MARK : - Properties    
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
        case "Male":
            maleCell.accessoryType = .checkmark
            femaleCell.accessoryType = .none
        case "Female":
            maleCell.accessoryType = .none
            femaleCell.accessoryType = .checkmark
        default:
            maleCell.accessoryType = .checkmark
            femaleCell.accessoryType = .none
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        
        try! realm.write {
            switch indexPath.row {
            case 0:
                currentUser.gender = "Male"
            case 1:
                currentUser.gender = "Female"
            default:
                break
            }
        }
        
        setCheckmark()
    }
}
