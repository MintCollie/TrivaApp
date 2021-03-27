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

// second part of json response with actual responces
struct MyResults: Codable, Identifiable {
    let id = UUID()
    let category: String
    let type: String
    let difficulty: String
    let question: String
    let correct_answer: String
    let incorrect_answers: Array<String>
}

class api {
    func getResponses(completion: @escaping ([MyResults]) -> ()){
        guard let url = URL(string: "https://opentdb.com/api.php?amount=1&type=boolean") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            let requests = try! JSONDecoder().decode(Response.self, from: data!)
            print(requests)
            DispatchQueue.main.async {
                completion(requests.results)
            }
        }
        .resume()
    }
}
