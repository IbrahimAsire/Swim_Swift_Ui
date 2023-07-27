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
    let language = ["Swift", "Java", "Python"]
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    let tipPercentages = [10, 15, 20, 25, 0]
    
    @State private var selectedLang = "Swift"
    
    
    var body: some View {
        NavigationView {
            Form {
                ForEach(0..<3){_ in
                    Text("Hello, World!")
                }
                
                
                Button("Tapped Here: \(tapCount) this's you number"){
                    self.tapCount += 2
                }
                .buttonStyle(.bordered).font(.headline)
                
                TextField("Type Any Thing: ", text: $name)
                Text("Your Name is \(name)")
                
                Picker("Select your language", selection: $selectedLang) {
                    ForEach(language, id: \.self) {
                        Text($0)
                    }
                    
                }
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of Naaaaas", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                    
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                
                .navigationTitle("We-Split")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
