//
//  ContentView.swift
//  SwimSwiftUi
//
//  Created by ibrahim asiri on 19/12/1444 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    @State private var name = ""

    var body: some View {
        NavigationView {
            Form {
                ForEach(0..<3){_ in
                    Text("Hello, World!")
                }
                Section {
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    
                }
                
                Button("Tapped Here: \(tapCount) this's you number"){
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
