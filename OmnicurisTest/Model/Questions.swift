//
//  Questions.swift
//  OmnicurisTest
//
//  Created by Prasad Ch on 19/09/19.
//  Copyright © 2019 Prasad Ch. All rights reserved.
//

import Foundation

// MARK: - Questions
struct Questions: Codable {
    let mcq: [Mcq]
}

// MARK: - Mcq
struct Mcq: Codable {
    let question, answer: String
    let options: [String]
    var selectedOption:String
}
