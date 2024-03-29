
import SwiftUI

struct ContentView: View {

    let anyThingToWriting = """

"""
    
    @State private var useRedText = false

    @State private var tapCount = 0
    @State private var name = ""
    let language = ["Swift", "Java", "Python"]
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    let tipPercentages = [10, 15, 20, 25, 0]
    
    @State private var selectedLang = "Swift"
    
    // For calculate the total per person
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
        
    }
    
    var body: some View {
        

        NavigationView {
            Form {
                
                ZStack {
                    VStack(spacing: 0) {
                        Color.green
                        Color.blue
                    }
                    
                    Text("Hola, I just try...")
                        .foregroundColor(.secondary)
                        .padding(50)
                        .background(.ultraThinMaterial)
                }
                .ignoresSafeArea()

                VStack{
                    HStack{
                        ForEach(0..<3){_ in
                            Text("Hello, World!")
                        }
                    }// end of Hstack
                    .font(.title)
                    .blur(radius: 3)// To reduce the words
                    
                    Button("Tapped Here: \(tapCount) this's you number"){
                        self.tapCount += 2
                        
                        useRedText.toggle()

                    }
                    .background(.red)
                    .frame(width: 230, height: 80)
                                        
                    .foregroundColor(useRedText ? .white : .blue)
                    
                    .buttonStyle(.bordered).font(.headline).foregroundColor(.white)
                    Spacer()
                }// end of vstack
                
                TextField("Type Your Name Please: ", text: $name)
                Text("Your Name is \(name) + your nmber is \(tapCount)")
                
                Picker("Select your language", selection: $selectedLang) {
                    ForEach(language, id: \.self) {
                        Text($0)
                    }
                    
                }
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of Naaaaas", selection: $numberOfPeople) {
                        ForEach(2 ..< 101) {
                            Text("\($0) people")
                        }
                    }
                    
                }
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<100, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.menu)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                } header: {
                    Text("Amount per person")
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
