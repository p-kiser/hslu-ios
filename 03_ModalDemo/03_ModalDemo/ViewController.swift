//
//  ViewController.swift
//  03_ModalDemo
//
//  Created by Pascal on 09.10.18.
//  Copyright © 2018 Pascal Kiser HSLU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let secondViewController = SecondViewController()
    var counter : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondViewController.modalTransitionStyle = .flipHorizontal
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var counterLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if counterLabel != nil {
            counter += 1
            counterLabel.text = String(counter)
        }
    }
    @IBAction func unwind(segue: UIStoryboardSegue) {
        //nop
    }
    
    @IBAction func showSecondViewButtonPressed(_ sender: UIButton) {
        self.present(secondViewController, animated: false, completion: nil)
    }
    @IBAction func customBackButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
}
