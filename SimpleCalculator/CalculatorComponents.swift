//
//  CalculatorComponents.swift
//  SimpleCalculator
//
//  Created by Christopher Richard on 30.09.23.
//

import SwiftUI

struct CalculatorComponents: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CalculatorButton: View {
    let title: String
    let action: (String) -> Void
    
    var body: some View {
        Button(title) {
            action(title)
        }
        .font(.title)
        .padding()
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(50)
        .shadow(radius: 10)
    }
}

//Define a struct for the resultpanel
struct ResultPanel: View {
    let result:String
    
    var body: some View {
        Text(result)
            .font(.largeTitle)
            .padding()
            .frame(maxWidth: .infinity, alignment: .trailing)
            .background(Color.gray)
    }
}

#Preview {
    CalculatorComponents()
}
