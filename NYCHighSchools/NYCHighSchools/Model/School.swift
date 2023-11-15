//
//  SchoolModel.swift
//  NYCHighSchools
//
//  Created by Russell Campbell on 11/13/23.
//

import Foundation

struct School: Codable, Identifiable {
    let id: String
    let schoolName: String
    
    //overviewParagraph, location, phoneNumber: String
    //let faxNumber, schoolEmail, requirement1, requirement2: String?
    
    enum CodingKeys:String, CodingKey {
        case id = "dbn"
        case schoolName = "school_name"
    }
}
