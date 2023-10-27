//
//  TinyRPGEngine.swift
//  TinyRPG2
//
//  Created by Russell Campbell on 10/27/23.
//

import Foundation


/*
 *  Here we model all types of Dependency Injection
 *
 */


//  Make a protocol for the Character Classes
protocol Saveable {
    var className: String {get set}
    var classSpecialty: String {get set}
    
    func saveFile(  )throws -> String
}

class SaveFile: Saveable {
    var className: String
    var classSpecialty: String
    
    init(className: String, classSpecialty: String) {
        self.className = className
        self.classSpecialty = classSpecialty
    }
    
    func saveFile(authManager: <<error type>>) throws -> String {
        <#code#>
    }
}
