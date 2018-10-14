//
//  EditViewController.swift
//  04_EditList
//
//  Created by Pascal on 14.10.18.
//  Copyright © 2018 Pascal Kiser HSLU. All rights reserved.
//

import UIKit


class EditViewController: UIViewController {
    
    var person : PersonData?
    
    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var zipTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        firstnameTextField.text = person!.firstName
        lastnameTextField.text = person!.lastName
        zipTextField.text = String(person!.plz)
    }
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        person?.lastName = lastnameTextField.text ?? ""
        person?.firstName = firstnameTextField.text ?? ""
        person?.plz = Int(zipTextField.text ?? "") ?? -1
        self.dismiss(animated: false, completion: nil)
    }
}
