//
//  TriveaRequest.swift
//  TriviaAppSwiftUI
//
//  Created by TJ mcintire on 3/24/21.
//

import SwiftUI

struct Response: Codable {
    let response_code: Int
    let results: Array<MyResults>
}

struct MyResults: Codable {
    let category: String
    let type: String
    let difficulty: String
    let question: String
    let correct_answer: String
    let incorrect_answers: Array<String>
}
let urlString = "https://opentdb.com/api.php?amount=1&type=boolean"

struct TriveaRequest: View {
    var body: some View {
        VStack {
            Button(action: { if let url = URL(string: urlString)
            {
                URLSession.shared.dataTask(with: url) {data, res, err in
                    if let data = data {
                        let decoder = JSONDecoder()
                        if let json = try? decoder.decode(Response.self, from: data){
                            //print(json)
                            print(json.results[0].category)
                            print(json.results[0].question)
                            }
                    }
                    }.resume()
        }}) {
                Text("New Question")
            }
        }
    }
}

struct TriveaRequest_Previews: PreviewProvider {
    static var previews: some View {
        TriveaRequest()
    }
}
