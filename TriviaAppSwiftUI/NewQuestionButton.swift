//
//  TriveaRequest.swift
//  TriviaAppSwiftUI
//
//  Created by TJ mcintire on 3/24/21.
//

import SwiftUI


let urlString = "https://opentdb.com/api.php?amount=1&type=boolean"

struct TriveaRequestButton: View {
    
    @State var requests: [Response] = []
    
    var body: some View {
        VStack {
            //button that processes api request
            Button(action: { if let url = URL(string: urlString)
            {
                // first working json request call
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
                    api().getResponses() { (requests) in
                        self.requests = requests
                    }
                })
        }
    }
}

struct TriveaRequest_Previews: PreviewProvider {
    static var previews: some View {
        TriveaRequestButton()
    }
}
