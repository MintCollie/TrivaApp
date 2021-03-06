//
//  ViewController.swift
//  TrivaApp
//
//  Created by TJ mcintire on 3/4/21.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = "https://opentdb.com/api.php?amount=1&type=boolean"
        getData(from: url)

        
         
    }
    
    private func getData(from url: String){
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
            
            guard let data = data, error == nil else {
                print("something went wrong")
                return
            }
            
            //have data
            
            var result: Response?
            do {
                result = try JSONDecoder().decode(Response.self, from: data)
            }
            
            catch {
                print("failed to convert \(error.localizedDescription)")
            }
            
            guard let json = result else {
                return
            }
            print(json.response_code)
            print(json.results[0].category)
            print(json.results[0].type)
            print(json.results[0].difficulty)
            print(json.results[0].question)
            
            
        })
        task.resume()
    }

    
}


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
