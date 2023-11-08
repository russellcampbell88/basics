//
//  SwiftUIZStack.swift
//  FirstSwiftUIApp
//
//  Created by Russell Campbell on 11/7/23.
//

import SwiftUI

struct SwiftUIZStack: View 
{
    
    var body: some View 
    {
        NavigationStack 
        {
            //  Basically allows you to place UI elements on top of one another on the Z-Axis
            ZStack
            {
                Image("JohtoMap").resizable()
                VStack
                {

                    NavigationLink("See the \n Johto Region!") 
            {
                        SwiftUIWebView()
                    }.buttonStyle(.borderedProminent)
                        .font(.largeTitle)

                }
                
            }
            
        }
    }
}

#Preview {
    SwiftUIZStack()
}
