//
//  ViewController.swift
//  06_ComAndCon
//
//  Created by Pascal on 21.10.18.
//  Copyright © 2018 Pascal Kiser HSLU. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, XMLParserDelegate {
    
    // Vorgaben Aufgabenstellung
    @IBOutlet weak var pickerView: UIPickerView!
    
    let dummyStrings : [String] = ["One", "Two", "Three"]
    var pickerStrings : [String] = []
    var tmpXmlStrings : [String] = []
    
    @IBAction func dateSourceChangePressed(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1:
            pickerStrings = getXmlData()
        case 2:
            pickerStrings = getJsonData()
        default:
            pickerStrings = dummyStrings
        }
        pickerView.reloadAllComponents()
        
    }
    @IBAction func testOperationQueuePressed(_ sender: UIButton) {
        var orderArray : [String] = []
        
        let blockOp1 = BlockOperation(block: {orderArray.append("1")})
        let blockOp2 = BlockOperation(block: {orderArray.append("2")})
        let blockOp3 = BlockOperation(block: {orderArray.append("3")})
    
        blockOp1.addDependency(blockOp2)
        blockOp1.addDependency(blockOp3)
        blockOp2.addDependency(blockOp3)
        
        let operationQueue = OperationQueue()
        let blocks : [Operation] = [blockOp1, blockOp2, blockOp3]
        operationQueue.addOperations(blocks, waitUntilFinished: true)
        
        let orderString = orderArray.joined(separator: ", ")
        let alertController = UIAlertController(
            title: "Block Operation Ordering",
            message: "The three block operations where executed in the following order " + orderString + ".",
            preferredStyle: .alert
        )
        
        let alertOkAction = UIAlertAction(
            title: "OK thx",
            style: UIAlertAction.Style.default,
            handler: nil
        )
        alertController.addAction(alertOkAction)
        self.present(alertController, animated: false, completion: nil)
    }
    
    func getXmlData() -> [String] {
        tmpXmlStrings = []
        let xmlUrl = URL(string: "https://wherever.ch/hslu/iPhoneAdressData.xml")!
        let parser  = XMLParser(contentsOf: xmlUrl)
        
        parser!.delegate = self
        parser!.parse()
        
        return tmpXmlStrings
    }
    func getJsonData() -> [String] {
        var tmpJsonStrings : [String] = []
        
        let jsonUrl = URL(string: "https://wherever.ch/hslu/iPhoneAdressData.json")!
        let rawData = try! Data(contentsOf: jsonUrl)
        let jsonData = try! JSONSerialization.jsonObject(with: rawData)
        
        for item in jsonData as! [[String: Any]] {
            let firstName : String = item["firstName"] as! String
            let lastName : String = item["lastName"] as! String
            tmpJsonStrings.append(firstName + " " + lastName)
        }
        return tmpJsonStrings
    }
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerStrings.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerStrings[row]
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }

    override func viewDidLoad() {
        pickerView.dataSource = self
        super.viewDidLoad()
        pickerStrings = dummyStrings
    }
    
    //tmpXmlStrings.append(attributeDict["firstName"]! + " " + attributeDict["lastName"]!)    func parser
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        if elementName == "Entry" {
            tmpXmlStrings.append(attributeDict["firstName"]!  + " " + attributeDict["lastName"]!)
        }
    }
}

