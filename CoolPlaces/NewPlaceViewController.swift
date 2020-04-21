//
//  NewPlaceViewController.swift
//  CoolPlaces
//
//  Created by Alex Tregubov on 21.04.2020.
//  Copyright © 2020 Alex Tregubov. All rights reserved.
//

import UIKit

class NewPlaceViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
    }
    
    // MARK: Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            print("image")
        } else {
            view.endEditing(true)
        }
    }

}

// MARK: Text field delegate

extension NewPlaceViewController: UITextFieldDelegate {
    
    // hidden keyboard on done tap
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
