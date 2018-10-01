//
//  PersonData.swift
//  SwiftProgrammers
//
//  Created by Pascal on 24.09.18.
//  Copyright © 2018 Pascal Kiser HSLU. All rights reserved.
//

class PersonData {
    var firstName : String
    var lastName : String
    var plz : Int
    
    init(firstName: String, lastName: String, plz: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.plz = plz
    }
}
