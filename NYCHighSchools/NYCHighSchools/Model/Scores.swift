//
//  Scores.swift
//  NYCHighSchools
//
//  Created by Russell Campbell on 11/14/23.
//

import Foundation

struct Scores: Codable, Identifiable 
{
    let id: String
    let schoolName, readingScore, mathScore, writingScore: String
    
    enum CodingKeys:String, CodingKey 
    {
        case id = "dbn"
        case schoolName   = "school_name"
        case readingScore = "sat_critical_reading_avg_score"
        case mathScore    = "sat_math_avg_score"
        case writingScore = "sat_writing_avg_score"
    }
}
