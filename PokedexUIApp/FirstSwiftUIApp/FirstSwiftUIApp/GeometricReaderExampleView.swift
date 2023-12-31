//
//  GeometricReaderExampleView.swift
//  FirstSwiftUIApp
//
//  Created by Russell Campbell on 11/7/23.
//

import SwiftUI

//  Geonmetry views are useful in cases where
//  you want to align views.
struct GeometricReaderExampleView: View {
    var body: some View {
        Text("Parent View")
            .frame(width: 200, height:  200)
            .border(.red)
        
        GeometryReader( content: { geometry in
            Text("Child View")
                .frame(width: 200, height: 200)
                .border(.blue)
                .position(x: geometry.size.width/2, y:
                            geometry.size.height/2)
            
        })
    }
}

#Preview {
    GeometricReaderExampleView()
}
