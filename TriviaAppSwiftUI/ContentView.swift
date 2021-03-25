//
//  ContentView.swift
//  TriviaAppSwiftUI
//
//  Created by TJ mcintire on 3/21/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack{
                TriveaRequestButton()
            }

            Text("test")
                .multilineTextAlignment(.center)
                .padding()
            HStack{
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("True")
                        .padding()
                }
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("False")
                        .padding()
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
