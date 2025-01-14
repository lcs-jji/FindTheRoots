//
//  ContentView.swift
//  FindTheRoots
//
//  Created by Xinchen Ji on 2025-01-14.
//

import SwiftUI

struct RootsCalculatorView: View {
    
    @State var a: Double = 1
    @State var b: Double = -6
    @State var c: Double = 8
    
    @State var priorResults: [Result] = []
    
    var result: String {
        
        let discriminant  = b * b - 4 * a * c
        
        if discriminant < 0 {
            return "No real roots."
        } else {
            let x1 = ( b * -1 - discriminant.squareRoot() ) / (2 * a)
            let x2 = ( b * -1 + discriminant.squareRoot() ) / (2 * a)
            
            return "x ≈ \(x1.formatted(.number.precision(.fractionLength(2)))) and x ≈ \(x2.formatted(.number.precision(.fractionLength(2))))"
        }
        
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image ("quad2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 500, height: 200)
                Spacer(minLength: 50)
                    
                HStack {
                    VStack {
                        Text ("\(a.formatted(.number.precision(.fractionLength(2))))")
                        Slider(value: $a, in: 1...10, step: 0.1)
                    }
                    
                    VStack {
                        Text ("\(b.formatted(.number.precision(.fractionLength(2))))")
                        Slider(value: $b, in: 1...10, step: 0.1)
                    }
                    
                    VStack {
                        Text ("\(c.formatted(.number.precision(.fractionLength(2))))")
                        Slider(value: $c, in: 1...10, step: 0.1)
                    }
                }
                Text ("\(result)")
                    .font(Font.custom("Times New Roman",size: 25.0, relativeTo: .body))
                
                Button(
                    action: {
                        let latestResult = Result(
                            a: a,
                            b: b,
                            c: c,
                            roots: result)
                        priorResults.append(latestResult)
                    }, label: {
                        Text ("Save Result")
                    })
                .buttonStyle(.bordered)
                .padding()
                
                // History Label
                HStack {
                    Text ("History")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                
                
                Spacer(minLength: 200)
                
            }
            .navigationTitle("Finding The Roots")

        }
    }
}

#Preview {
    RootsCalculatorView()
}
