//
//  GeometricReaderView.swift
//  FirstSwiftUIApp
//
//  Created by Russell Campbell on 11/8/23.
//

import SwiftUI

struct GeometricReaderView: View {
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
    GeometricReaderView()
}
