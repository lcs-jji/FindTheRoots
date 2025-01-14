//
//  ResultVIew.swift
//  FindTheRoots
//
//  Created by Xinchen Ji on 2025-01-14.
//

import SwiftUI

struct ResultView: View {
    
    let somePriorResult: Result
    
    var body: some View {
        VStack(spacing: 10){
            
            HStack(spacing: 30){
                Text("a: \(resultForPreviews.a)")
            }
            
        }
    }
}

#Preview {
    ResultView(somePriorResult: resultForPreviews)
}
