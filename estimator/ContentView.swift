//
//  ContentView.swift
//  estimator
//
//  Created by Mateo Heredia on 8/31/26.
//

import SwiftUI



struct ContentView: View {
    
    
    @State private var awningsCount = 0
    @State private var frenchDoorPrice = 100.0
    @State private var frenchdoors = 0
    
    var frenchdoorFormula: Double {
        let frenchdoorAmount = Double(frenchdoors)
        let frenchdoorPrice = frenchdoorAmount * frenchDoorPrice
        return frenchdoorPrice
    }
    
    var body: some View {
        NavigationStack{
            
            Form {
                Section ("Roof Cleaning") {
                    HouseItems(houseItem: "Pressure Clean Roof", dollarAmount: 0, notes: "")
                    HouseItems(houseItem: "Roof Soft Wash", dollarAmount: 0, notes: "")
                }.headerProminence(.increased)        .navigationTitle("Optionals")
                
                
                Section("Painting") {
                    HouseItems(houseItem: "Roof Metal Flashing", dollarAmount: 0, notes: "")
                    
                    HouseItems(houseItem: "Window Frames", dollarAmount: 0, notes: "")
                    
                    
                    
                    HStack{
                        Stepper("\(frenchdoors.formatted()) French Doors",value: $frenchdoors, in: 0...10)
                            .padding()
                        Text(frenchdoorFormula, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        
                    }
                    
                    //                                    .fixedSize() .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 50))
                    
                    
                    
                    
                    
                    HouseItems(houseItem: "Window Frames", dollarAmount: 0, notes: "")
                    HouseItems(houseItem: "Railings", dollarAmount: 0, notes: "")
                    HouseItems(houseItem: "Window Bars", dollarAmount: 0, notes: "")
                    HouseItems(houseItem: "Accordion Shutters", dollarAmount: 0, notes: "")
                    HouseItems(houseItem: "Decorative Shutters", dollarAmount: 0, notes: "")
                    HouseItems(houseItem: "Fences", dollarAmount: 0, notes: "")
                    HouseItems(houseItem: "Gates", dollarAmount: 0, notes: "")
                    HouseItems(houseItem: "Soffit or ceiling different color than walls", dollarAmount: 0, notes: "")
                    HouseItems(houseItem: "Downspouts different color than walls", dollarAmount: 0, notes: "")
                    HouseItems(houseItem: "Awnings", dollarAmount: 0, notes: "")
                    HStack{
                        Stepper(value: $awningsCount, in:
                                    0...10) {
                            Text("Awnings: \(awningsCount)")
                            
                        }
                        //                                        .fixedSize() /*.padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 50))*/
                    }
                    HouseItems(houseItem: "Perimetral walls", dollarAmount: 0, notes: "")
                }
            }.headerProminence(.increased)
        }
        
        
        
        
    }
}




struct Checkbox: ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
            configuration.label
            
        })
    }
}


struct HouseItems: View {
    @State var isOn = false
    let houseItem: String
    @State var dollarAmount: Int
    @State var notes: String
    
    var body: some View {
        VStack{
            HStack(spacing: 0){
                Toggle(isOn: $isOn){
                    Text("")}
                .toggleStyle(Checkbox())
                //            .padding(5)
                Spacer()
                
                Text(houseItem)/*.foregroundColor(.white)*///
                
            }
            HStack(spacing: 230){
                TextField("notes", text: $notes)
                    .border(.red)
                
                TextField("", value: $dollarAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
            }
        }
    }
}
#Preview {
    ContentView()
}
