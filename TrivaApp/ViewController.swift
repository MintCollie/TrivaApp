//
//  ViewController.swift
//  TrivaApp
//
//  Created by TJ mcintire on 3/4/21.
//

import UIKit

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

class ViewController: UIViewController {
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBAction func retryButton(_ sender: Any) {
        if let url = URL(string: urlString)
            {
                URLSession.shared.dataTask(with: url) {data, res, err in
                    if let data = data {
                        let decoder = JSONDecoder()
                        if let json = try? decoder.decode(Response.self, from: data){
                            print(json)
                            print(json.results[0].category)
                            print(json.results[0].question)
                            let jsonResponse = json.results[0].question
                            self.questionText.text = jsonResponse
                        }
                    }
                }.resume()
    }
    
   // let dispatchGroup = DispatchGroup()

    
        func viewDidLoad() {
        super.viewDidLoad()
        
        
        }
    }
}
