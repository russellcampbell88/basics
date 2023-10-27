//
//  TinyCharacterClasses.swift
//  TinyRPG2
//
//  Created by Russell Campbell on 10/26/23.
//

import Foundation

/* Access Modification
 * 1. Internal     - (Default) Anything which is defined in the same                             modaccessible. Only within the scope. It's secure.
 * 2. Private      - the most restrictive access modifier.
 * 3. FilePrivate  -
 * 4. Public       - most permissive access modifier. There are no restrictions,
                     therefore you can access the file from a different class.
                     Used to give you access in another frame. Disallows subclassing
 * 5. Open         - Allows subclassing.
 */

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

let characters = [CharacterClass(className: "Black Mage", classSpecialty: "Black Magic"),
                  CharacterClass(className: "White Mage", classSpecialty: "White Magic"),
                  CharacterClass(className: "Blue Mage", classSpecialty: "Blue Magic"),
                  CharacterClass(className: "Summoner", classSpecialty: "Summons"),
                  CharacterClass(className: "Tank", classSpecialty: "Self-Taunt"),
                  CharacterClass(className: "Berserker", classSpecialty: "DPS")]
