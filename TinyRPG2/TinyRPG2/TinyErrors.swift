//
//  TinyErrors.swift
//  TinyRPG2
//
//  Created by Russell Campbell on 10/26/23.
//

import Foundation


//  Here we tackle error handling.

//  The enum storing all our possible savefile errors
enum TinyRPGErrors: Error {
    case failedToSaveFile
    case fileDidNotLoad
    case corruptSaveFile
    case unknown
}

// Dispplay our errors to console
extension TinyRPGErrors: LocalizedError {
    var errorDescription: String?
    {
        switch self
        {
        case .failedToSaveFile:
            return NSLocalizedString("Failed to save the game", comment: "failedToSaveFile")
        case .fileDidNotLoad:
            return NSLocalizedString("Failed to load the game", comment: "failedToLoadFile")
        case .unknown:
            return NSLocalizedString("Could not pinpoint error", comment: "unknown")
        default:
            return NSLocalizedString("Save file corrupted.", comment: "corruptSaveFile")
        }
    }
}
