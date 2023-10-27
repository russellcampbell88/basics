//
//  TinyRPGEngine.swift
//  TinyRPG2
//
//  Created by Russell Campbell on 10/26/23.
//

import Foundation


/*
 *  Here we model all types of Dependency Injection
 *
 */


//  Make a protocol for the Character Classes
protocol Saveable {
    var saveFileName: String {get set}
    var loadFileName: String {get set}
    
    func saveFile( authManager: TinySaveFileValidation? )throws -> String
}

class SaveFile: Saveable {
    var saveFileName: String
    var loadFileName: String
    
    init(className: String, classSpecialty: String) {
        self.saveFileName = saveFileName
        self.loadFileName = loadFileName
    }
    
    func saveFile(authManager: TinySaveFileValidation?) throws -> String {
        guard let authManager = authManager else
        {
            //  Throw the error
            throw TinyRPGErrors.unknown
        }
        
        if authManager.loadFile()
        {
            if saveFileName == "" {
                throw TinyRPGErrors.failedToSaveFile
            } else if loadFileName == "" {
                throw TinyRPGErrors.fileDidNotLoad
            }
            
            return self.loadFileName
        } else {
            throw TinyRPGErrors.corruptSaveFile
        }
    }
}
