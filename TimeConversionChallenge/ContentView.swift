//
//  ContentView.swift
//  TimeConversionChallenge
//
//  Created by Tuğberk Ata on 3.06.2023.
//

import SwiftUI


struct ContentView: View {
    // We have 3 inputs 1 for measure, 2 for desired input, output
    @State private var inputMeasure: Double = 0.0
    @State private var inputType: String = ""
    @State private var outcomeType: String = ""
    @FocusState private var amountIsFocused: Bool
    
    
    // I am using this to catch the desired input, output type
    let timeFrame = ["second", "minute", "hour","day", "year"]
    
    //This turns the input measure to the universal time by checking the types, then turns the universal time to the desired kind
    var timeconversion: Double{
        
        var universalTime = 0.0
        
        if inputType == "second" {
            universalTime = inputMeasure / 60
        }
        else if inputType == "minute" {
            universalTime = inputMeasure
        }
        else if inputType == "hour" {
            universalTime = inputMeasure * 60
        }
        else if inputType == "day" {
            universalTime = inputMeasure * 1440
        }
        else if inputType == "year" {
            universalTime = inputMeasure * 525600
        }
        
        if outcomeType == "second" {
            return universalTime * 60
        }
        else if outcomeType == "minute" {
            return universalTime
        }
        else if outcomeType == "hour" {
            return universalTime / 60
        }
        else if outcomeType == "day" {
            return universalTime / 1440
        }
        else if outcomeType == "year" {
            return universalTime / 525600
        }
        else {
            return universalTime
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                //gets the measure
                Section {
                    TextField ("Amount Of Time", value: $inputMeasure, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                }
            header: {
                Text("Amount Of Time")
            }
                //gets the starting type
                Section {
                    Picker ("From", selection: $inputType) {
                        ForEach(timeFrame, id: \.self) {
                            Text("\($0)")
                        }
                    }
                }
            header: {
                Text("What do you want to convert")
            }
                //gets the output type
                Section {
                    Picker ("To", selection: $outcomeType) {
                        ForEach(timeFrame, id: \.self) {
                            Text("\($0)")
                        }
                    }
                }
            header: {
                Text("What type do you want it")
            }
                //shows the result
                Section {
                    Text (timeconversion, format: .number)
                }
            header: {
                Text("Result")
            }
            }
            .navigationTitle("Time Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
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
