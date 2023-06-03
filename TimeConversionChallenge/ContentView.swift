//
//  ContentView.swift
//  TimeConversionChallenge
//
//  Created by Tuğberk Ata on 3.06.2023.
//

import SwiftUI


struct ContentView: View {
    // We have 3 inputs 1 for measure, 2 for desired input, output
    // We have 2 values to change the desired input to universal time unit then that to desired output type
    @State private var inputMeasure: Double = 0.0
    @State private var inputType: String = ""
    @State private var outcomeType: String = ""
    @State var universalTimeInput: Double = 0
    @State var universalTimeOutput: Double = 0
 
    // I am using this to catch the desired input, output type
    var timeFrame = ["second", "minute", "hour", "year"]
    
    //This turns the input measure to the universal time by checking the types
    var timeconversionInput: Double{
        if inputType == "second" {
            universalTimeInput = inputMeasure / 60
        }
        else if inputType == "minute" {
            universalTimeInput = inputMeasure
        }
        else if inputType == "hour" {
            universalTimeInput = inputMeasure * 60
        }
        else if inputType == "year" {
            universalTimeInput = inputMeasure * 525600
        }
        return universalTimeInput
    }
    
    //this turns the universal time to the final outcome by checking the outcome types
    
    var timeconversionOutput: Double{
        if outcomeType == "second" {
            universalTimeOutput = universalTimeInput * 60
        }
        else if outcomeType == "minute" {
            universalTimeOutput = universalTimeInput
        }
        else if outcomeType == "hour" {
            universalTimeOutput = universalTimeInput / 60
        }
        else if outcomeType == "year" {
            universalTimeOutput = universalTimeInput / 525600
        }
        return universalTimeOutput
    }
    
    
    

    var body: some View {
       //gets the measure
        Form {
            Section {
                TextField ("Amount Of Time", value: $inputMeasure, format: .number)
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
        Text("Desired Outcome Type")
        }
            //shows the result
            Section {
                Text (universalTimeOutput, format: .number)
            }
        header: {
        Text("Result")
        }
            
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
