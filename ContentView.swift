//
//  ContentView.swift
//  UnitConvertor
//
//  Created by Aniket Sharma on 10/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var number = 0
    @FocusState private var numFocused : Bool
    @State private var sourceUnit = "Celsius"
    @State private var outputUnit = "Kelvin"
    let sourceUnits = ["Celsius","Fahrenheit","Kelvin"]
    var convertedValue : Double {
        var inputValue = Double(number)
        var output = 0.0
                
                switch sourceUnit {
                case "Kelvin":
                    output = inputValue - 273.15 
                case "Fahrenheit":
                    output = (inputValue - 32) * 5/9
                default:
                    output = inputValue
                }
                
                switch outputUnit {
                case "Fahrenheit":
                    output = output * 9/5 + 32
                case "Kelvin":
                    output = output + 273.15
                default:
                    break
                }
                
                return output
    }
    var body: some View {
        NavigationStack{
            Form{
                Section("Enter Number"){
                    TextField("Enter number",value: $number,format: .number)
                        .keyboardType(.numberPad)
                        .focused($numFocused)
                }
                Section("Source Unit"){
                    Picker("Source Unit",selection: $sourceUnit){
                        ForEach(sourceUnits, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle()).colorMultiply( Color.orange)
                }
                Section("Output Unit"){
                    Picker("Source Unit",selection: $outputUnit){
                        ForEach(sourceUnits, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle()).colorMultiply( Color.yellow)
                }
                Section("Converted Value"){
                    Text(convertedValue,format: .number)
                }
                
            }
            .navigationTitle("Unit Convertor")
            .toolbar{
                if numFocused {
                    Button("Done"){
                        numFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
