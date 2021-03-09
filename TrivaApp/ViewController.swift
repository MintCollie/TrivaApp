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
    
    let dispatchGroup = DispatchGroup()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getJson { (json) in
            print("finished")
        }
        dispatchGroup.notify(queue: .main) {
            print("all finished")
        }
//        if let url = URL(string: urlString)
//            {
//                URLSession.shared.dataTask(with: url) {data, res, err in
//                    if let data = data {
//                        print("hey")
//
//                        let decoder = JSONDecoder()
//                        if let json = try? decoder.decode(Response.self, from: data){
//                            print(json)
//                        }
//                    }
//                }.resume()
//                print("finished")
//        }
        
    }
    
    func getJson(completion: @escaping (Response) -> ()) {
        dispatchGroup.enter()
        if  let url = URL(string: urlString)
        {
            URLSession.shared.dataTask(with: url) {data, res, err in
                if let data = data {
                    let decoder = JSONDecoder()
                    if let json = try? decoder.decode(Response.self, from: data) {
                        self.dispatchGroup.leave()
                        completion(json)
                    }
                }
            }.resume()
        }
    }
}
