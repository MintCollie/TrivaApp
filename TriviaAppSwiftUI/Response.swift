//
//  Response.swift
//  TriviaAppSwiftUI
//
//  Created by TJ mcintire on 3/25/21.
//

import Foundation

//begin of json response output continues to struct below
struct Response: Codable {
    let response_code: Int
    let results: Array<MyResults>
}
