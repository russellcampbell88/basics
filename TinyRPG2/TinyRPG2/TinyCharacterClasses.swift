//
//  TinyCharacterClasses.swift
//  TinyRPG2
//
//  Created by Russell Campbell on 10/26/23.
//

import Foundation

class CharacterClass {
    //  Use access modifiers to keep the attributes secure
    private let className: String
    private let classSpecialy: String
    
    //  Class constructor
    init( className: String, classSpecialty: String )
    {
        self.className = className
        self.classSpecialy = classSpecialty
    }
    
    //  Getters
    func getClassName() -> String {
        return self.className
    }
    
    func getClassSpecialty() -> String {
        return self.classSpecialy
    }
}

let characters = [CharacterClass(className: "Mage", classSpecialty: "Magic"),
                  CharacterClass(className: "Berserker", classSpecialty: "DPS")]
