//
//  TriveaRequest.swift
//  TriviaAppSwiftUI
//
//  Created by TJ mcintire on 3/24/21.
//

import SwiftUI


let urlString = "https://opentdb.com/api.php?amount=1&type=boolean"

struct TriveaRequestButton: View {
    var body: some View {
        VStack {
            // first working json request call
            Button(action: { if let url = URL(string: urlString)
            {
                URLSession.shared.dataTask(with: url) {data, res, err in
                    if let data = data {
                        let decoder = JSONDecoder()
                        if let json = try? decoder.decode(Response.self, from: data){
                            //print(json)
                            print(json.results[0].category)  //prints out the catgeory of the current json call
                            print(json.results[0].question) //prints out the question of the current json call
                            }
                    }
                    }.resume()
        }}) {
                Text("new question")
            }
            
            Text("Hello world!")
                .onAppear(perform: {
                    api().getResponses()
                })
        }
    }
}

//second json request try, not working
//class apiCall {
//    func getUsers(completion:@escaping ([Response]) -> ()) {
//        guard let url = URL(string: "https://opentdb.com/api.php?amount=1&type=boolean") else { return }
//        URLSession.shared.dataTask(with: url) { (data, _, _) in
//            let users = try! JSONDecoder().decode([Response].self, from: data!)
//            print(users)
//
//            DispatchQueue.main.async {
//                completion(users)
//            }
//        }
//        .resume()
//    }
//}


//class FetchToDo: ObservableObject {
//  // 1.
//  @Published var todos = [Response]()
//
//    init() {
//        let url = URL(string: "https://opentdb.com/api.php?amount=1&type=boolean")!
//        // 2.
//        URLSession.shared.dataTask(with: url) {(data, response, error) in
//            do {
//                if let todoData = data {
//                    // 3.
//                    let decodedData = try JSONDecoder().decode([Response].self, from: todoData)
//                    DispatchQueue.main.async {
//                        self.todos = decodedData
//                    }
//                } else {
//                    print("No data")
//                }
//            } catch {
//                print("Error")
//            }
//        }.resume()
//    }
//}



struct TriveaRequest_Previews: PreviewProvider {
    static var previews: some View {
        TriveaRequestButton()
    }
}
