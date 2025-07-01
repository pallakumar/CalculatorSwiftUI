//
//  ContentView.swift
//  CalculatorSwiftUI
//
//  Created by apple on 30/06/25.
//

import SwiftUI


struct ContentView: View {
    @State private var input: String = ""
    @State private var output: String = ""
    
    let calculator = CalculatorSwiftUI()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {

                TextField("Enter 1\\n2,3", text: $input)
                    .keyboardType(.numbersAndPunctuation)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                Button("Calculate") {
                    do {
                        let processedInput = input.replacingOccurrences(of: "\\n", with: "\n")
                        let result = try calculator.add(processedInput)
                        output = "Result: \(result)"
                    } catch {
                        output = "Error: \(error)"
                    }
                }
                .buttonStyle(.borderedProminent)
                Text(output)
                    .font(.title3)
                    .padding()
                Spacer()
            }
            .padding()
            .navigationTitle("String Calculator")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
