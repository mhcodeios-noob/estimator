//
//  ContentView.swift
//  estimator
//
//  Created by Mateo Heredia on 8/31/26.
//

import SwiftUI


struct ContentView: View {
    
    @State private var frenchDoorCount = 0
    @State private var awningsCount = 0
    
    var body: some View {
        ScrollView(.vertical){
        VStack{

            HouseItems(houseItem: "Roof Metal Flashing", dollarAmount: 0, notes: "")
            HouseItems(houseItem: "Window Frames", dollarAmount: 0, notes: "")
          
                
                    HouseItems(houseItem: "French Doors", dollarAmount: 0, notes: "")
            HStack{
                Stepper(value: $frenchDoorCount, in:
                            0...10) {
                    Text("French doors: \(frenchDoorCount)")
                    
                }
                            .fixedSize() .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 50))
            }
                    
                
            
            HouseItems(houseItem: "Roof", dollarAmount: 0, notes: "")
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
                            .fixedSize() .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 50))
            }
            HouseItems(houseItem: "Perimetral walls", dollarAmount: 0, notes: "")
        }
    }
        
        
        .padding()
        
    }
        
    

}
struct Checkbox: ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                configuration.label
            }
        })
    }
}


struct HouseItems: View {
    @State var isOn = false
     let houseItem: String
    @State var dollarAmount: Int
    @State var notes: String
    
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                Toggle(isOn: $isOn){
                    Text("")}
                .toggleStyle(Checkbox())
                Text(houseItem).foregroundColor(.white) .font(.title3) .fontWeight(.bold)
                    .padding()
                    .background(Color.blue, in: RoundedRectangle(cornerRadius: 8))
                
                TextField("", value: $dollarAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .padding()
                TextField("notes", text: $notes)
                
            }
        }
    }
}
#Preview {
    ContentView()
}
