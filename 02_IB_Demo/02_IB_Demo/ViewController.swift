//
//  ViewController.swift
//  02_IB_Demo
//
//  Created by Pascal on 30.09.18.
//  Copyright © 2018 Pascal Kiser HSLU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        sliderLabel.text = String(format: "%.2f", slider.value)
        let title = spinner.isAnimating ? "STOP SPINNING" : "start spinning"
        spinnerButton.setTitle(title, for: UIButton.State.normal)
    }

    var sliderAlertShown = false
    let sliderWarningLimit = 80
    
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var spinnerButton: UIButton!
    
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        sliderLabel.text = String(format: "%.2f", sender.value)
        
        if sender.value > Float(sliderWarningLimit) && self.sliderAlertShown == false {
            
            self.sliderAlertShown = true
            
            let alertController = UIAlertController(
                title: "Alert",
                message: String(format:"You've reached %d%!", sliderWarningLimit),
                preferredStyle: .alert
            )
            let alertOkAction = UIAlertAction(
                title: "OK",
                style: .destructive,
                handler: nil
            )
            alertController.addAction(alertOkAction)
            self.present(alertController, animated: true, completion: nil)
        } else if sender.value < Float(sliderWarningLimit) && self.sliderAlertShown == true {
            self.sliderAlertShown = false
        }

    }
    
    @IBAction func colorButtonValueChanged(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            self.view.backgroundColor = UIColor.white
        } else {
            self.view.backgroundColor = UIColor.gray
        }
    }
    
    @IBAction func spinButtonPressed(_ sender: UIButton) {
     
        if spinner.isAnimating {
            spinner.stopAnimating()
            sender.setTitle("start spinning", for: UIButton.State.normal)
            sender.setTitle("Start Spinning", for: UIButton.State.focused)
            
        } else {
            spinner.startAnimating()
            sender.setTitle("STOP SPINNING", for: UIButton.State.normal)
        }
 
    }
    @IBAction func infoButtonPressed(_ sender: UIButton) {
        let alertController = UIAlertController(
            title: "Information",
            message: "Congratulations, you just pressed the i-Button, at the top right! It looks like you're enjoying this beatiful application... ;-)",
            preferredStyle: UIAlertController.Style.alert
        )
        let alertOkAction = UIAlertAction(
            title: "OK",
            style: UIAlertAction.Style.default,
            handler: nil
        )
        let alertReallyAction = UIAlertAction(
            title: "... really?",
            style: UIAlertAction.Style.default,
            handler: nil
        )
        alertController.addAction(alertOkAction)
        alertController.addAction(alertReallyAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

