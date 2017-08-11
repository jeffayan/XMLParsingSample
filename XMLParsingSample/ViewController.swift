//
//  ViewController.swift
//  XMLParsingSample
//
//  Created by Developer on 12/08/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import UIKit


class ViewController: UIViewController, XMLParserDelegate {

    private var parser: XMLParser!
    
    private var parseData = false
    
    private var stringArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let url = "https://www.w3schools.com/xml/simple.xml"
        
        if let url = URL(string: url){
            
            self.parser = XMLParser(contentsOf: url)
            self.parser.delegate = self
            
            if parser.parse(){
                
                print(stringArray)
                
            }
            
            
        }
        
    }

    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        print("-->Did Start --",elementName)
        
        parseData = elementName == "description"
        
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        print("-->Did End --",elementName)
        
        parseData = false
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print("Error --", parseError.localizedDescription)
    }
    
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        print(parser.lineNumber,"Found ---",string)
        
        if parseData, !string.isEmpty{
            
            stringArray.append(string)
            
        }
        
    
    }
    
   /* func parser(_ parser: XMLParser, foundElementDeclarationWithName elementName: String, model: String) {
        
        print("Found ---",elementName)
        
    }
    
    func parser(_ parser: XMLParser, foundAttributeDeclarationWithName attributeName: String, forElement elementName: String, type: String?, defaultValue: String?) {
        print("Found with Attr",attributeName)
        
    }*/

}

