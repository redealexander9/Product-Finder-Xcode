//
//  ContentView.swift
//  Product Finder
//
//  Created by user279679 on 7/16/25.
//

import SwiftUI

struct ContentView: View {
    @State private var correctUPC: String = ""
    var body: some View {
            VStack{
            TextField("Enter UPC",text: $correctUPC)
                .keyboardType(.numberPad)
                .onChange(of: correctUPC) { oldValue, newValue in
                    let filtered = newValue.filter {$0.isNumber}
                    
                    if filtered.count <= 12 {
                        correctUPC = filtered
                    } else {
                        correctUPC = String(filtered.prefix(12))
                    }
                }
                .textFieldStyle(.roundedBorder)
                .padding([.horizontal], 60)
            Button(action: findUPC){
                Text("Find UPC")
            }
            .padding([.bottom], 300)
        }
    }
    func findUPC(){
        
    }
}

#Preview {
    ContentView()
}
