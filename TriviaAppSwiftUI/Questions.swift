//
//  Questions.swift
//  TriviaAppSwiftUI
//
//  Created by TJ mcintire on 3/25/21.
//

import Foundation

// second part of json response with actual responces
struct MyResults: Codable {
    let category: String
    let type: String
    let difficulty: String
    let question: String
    let correct_answer: String
    let incorrect_answers: Array<String>
}
