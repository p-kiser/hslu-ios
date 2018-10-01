//
//  ViewController.swift
//  SwiftProgrammers
//
//  Created by Pascal on 23.09.18.
//  Copyright © 2018 Pascal Kiser HSLU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let data = DataProvider.sharedInstance
    
    let offset : Int = 150
    let rowHeight : Int = 50
    let usePersonData : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add title
        self.view.backgroundColor = UIColor.darkGray
        let label = UILabel(frame: CGRect(x: 50, y: 50, width: 300, height: 60))
        label.backgroundColor = UIColor.brown
        label.text = "Get Schwifty"
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor.white
        self.view.addSubview(label)
        
        // add members
        if (usePersonData) {
            // from PersonData array
            for (index, person) in data.memberPersons.enumerated() {
                let pos = index * rowHeight + offset
                addLabel(person: person, position: pos)
            }
        } else {
            // from string array
            for (index, name) in data.memberNames.enumerated() {
                let pos = Float(index * rowHeight + offset)
                addLabel(name: name, position: pos)
            }
        }
    }
    
    // add label for String
    func addLabel(name: String, position: Float) {
        
        let label = UILabel(frame: CGRect(x: 50, y: Int(position), width: 300, height: 60))
        label.text = name
        label.textColor = getColor(position: Int(position))
        self.view.addSubview(label)
    }
    // add label for PersonData object
    func addLabel(person: PersonData, position: Int) {
        let label = UILabel(frame: CGRect(x: 50, y: position, width: 300, height: 60))
        label.text = person.firstName + "\t" + person.lastName +  "\t" + String(person.plz)
        label.textColor = getColor(position: position)
        self.view.addSubview(label)
    }
    
    // return a color based on position
    func getColor(position: Int) -> UIColor {
        var color : UIColor;
        switch ((Int(position) - self.offset)/self.rowHeight) % 3 {
        case 0:
            color = UIColor.green
        case 1:
            color = UIColor.magenta
        case 2:
            color = UIColor.cyan
        default:		
            color = UIColor.gray
        }
        return color
    }
}
