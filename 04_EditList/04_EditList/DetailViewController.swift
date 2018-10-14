//
//  DetailViewController.swift
//  04_EditList
//
//  Created by Pascal on 14.10.18.
//  Copyright © 2018 Pascal Kiser HSLU. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailFirstnameLabel: UILabel!
    @IBOutlet weak var detailLastnameLabel: UILabel!
    @IBOutlet weak var detailZipLabel: UILabel!
    
    var detailItem: PersonData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        detailFirstnameLabel.text = detailItem!.firstName
        detailLastnameLabel.text = detailItem!.lastName
        detailZipLabel.text = String(detailItem!.plz)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! EditViewController
        controller.person = detailItem
    }
}

