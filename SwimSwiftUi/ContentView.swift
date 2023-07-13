//
//  ContentView.swift
//  SwimSwiftUi
//
//  Created by ibrahim asiri on 19/12/1444 AH.
//

import SwiftUI

struct ContentView: View {
    @State var tapCount = 0
    @State var name = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    
                }
                Section {
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    
                }
                
                Button("Tapped Here: \(tapCount)"){
                    self.tapCount += 1
                }
                .buttonStyle(.bordered).font(.headline)
                
                TextField("Type Any Thing: ", text: $name)
                Text("Your Name is \(name)")
            }
            
            .navigationTitle("Test")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
