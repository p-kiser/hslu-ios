//
//  DataProvider.swift
//  SwiftProgrammers
//
//  Created by Pascal on 23.09.18.
//  Copyright © 2018 Pascal Kiser HSLU. All rights reserved.
//

class DataProvider {
    
    static let sharedInstance = DataProvider()
    
    var memberNames : [String]
    var memberPersons : [PersonData]
    
    init() {
        self.memberNames = [
            "Haile Selassie",
            "Hidegard von Bingen",
            "Bunny Wailer",
            "Freiherr von Münchhausen",
            "Ringo Starr",
            "Richie Stallman",
            "Diogenes von Sinope",
            "Hubertus Halbfas"
        ]
        
        self.memberPersons = [
            PersonData(firstName: "Hansfranz", lastName: "Michelmeier", plz: 6064),
            PersonData(firstName: "Richie", lastName: "Spice", plz: 8000),
            PersonData(firstName: "Erding", lastName: "Weißbier", plz: 4554),
            PersonData(firstName: "Hubertus", lastName: "Halbfas", plz: 6003),
            PersonData(firstName: "Geter", lastName: "Gowen", plz: 6017),
            PersonData(firstName: "Bootsy", lastName: "Collins", plz: 1234),
            PersonData(firstName: "Flavor", lastName: "Flav", plz: 6060)
        ]
    }
}

