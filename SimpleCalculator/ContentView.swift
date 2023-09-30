//
//  ContentView.swift
//  SimpleCalculator
//
//  Created by Christopher Richard on 30.09.23.
//
import SwiftUI

struct ContentView: View {
    // Variables to store input and calculation state
    @State private var currentInput = ""
    @State private var currentOperator: String?
    @State private var previousValue: Double = 0.0
    
    var body: some View {
        VStack {
            ResultPanel(result: currentInput)
            
            HStack {
                CalculatorButton(title: "7", action: appendDigit)
                CalculatorButton(title: "8", action: appendDigit)
                CalculatorButton(title: "9", action: appendDigit)
                CalculatorButton(title: "÷", action: setOperator)
            }
            
            HStack {
                CalculatorButton(title: "4", action: appendDigit)
                CalculatorButton(title: "5", action: appendDigit)
                CalculatorButton(title: "6", action: appendDigit)
                CalculatorButton(title: "×", action: setOperator)
            }
            
            HStack {
                CalculatorButton(title: "1", action: appendDigit)
                CalculatorButton(title: "2", action: appendDigit)
                CalculatorButton(title: "3", action: appendDigit)
                CalculatorButton(title: "-", action: setOperator)
            }
            
            HStack {
                CalculatorButton(title: "0", action: appendDigit)
                CalculatorButton(title: ".", action: appendDigit)
                CalculatorButton(title: "=", action: { _ in calculate() })
                CalculatorButton(title: "+", action: setOperator)
            }
            
            Button("Clear") {
                currentInput = ""
                currentOperator = nil
                previousValue = 0.0
            }
            .font(.headline)
            .padding()
        }
    }
    
    func appendDigit(_ digit: String) {
        currentInput += digit
    }
    
    func setOperator(_ operatorSymbol: String) {
        if currentOperator != nil {
            calculate()
        }
        previousValue = Double(currentInput) ?? 0.0
        currentInput = ""
        currentOperator = operatorSymbol
    }
    
    func calculate() {
        guard let operatorSymbol = currentOperator, !currentInput.isEmpty else {
            return
        }
        
        guard let currentValue = Double(currentInput) else {
            return
        }
        
        switch operatorSymbol {
        case "+":
            previousValue += currentValue
        case "-":
            previousValue -= currentValue
        case "×":
            previousValue *= currentValue
        case "÷":
            if currentValue != 0 {
                previousValue /= currentValue
            } else {
                currentInput = "Error"
                return
            }
        default:
            break
        }
        
        currentInput = String(previousValue)
        currentOperator = nil
    }

}

struct CalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
