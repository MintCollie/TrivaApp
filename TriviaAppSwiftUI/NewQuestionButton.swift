//
//  TriveaRequest.swift
//  TriviaAppSwiftUI
//
//  Created by TJ mcintire on 3/24/21.
//

import SwiftUI


let urlString = "https://opentdb.com/api.php?amount=1&type=boolean"

struct TriveaRequestButton: View {
    
    @State var response: [MyResults] = []
    
    var body: some View {
        VStack {
            List (response){ MyResults in
            
                Text(MyResults.question)
                
        }
        .onAppear(perform: {
            api().getResponses { (response) in
                self.response = response
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
