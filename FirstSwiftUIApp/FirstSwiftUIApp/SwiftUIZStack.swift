//
//  SwiftUIZStack.swift
//  FirstSwiftUIApp
//
//  Created by Russell Campbell on 11/7/23.
//

import SwiftUI

struct SwiftUIZStack: View {
    var body: some View {
        //  Basically allows you to place UI elements on top of one another on the Z-Axis
        ZStack{
            Image("JohtoMap").resizable()
            VStack{
                Text("Hello, World!").font(.largeTitle)
                    .foregroundStyle(.orange)
                Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                    
                }.buttonStyle(.borderedProminent)
                    .font(.largeTitle)
            }
            
        }
        /*ZStack {
         Image("Ocean").resizable()
         
         VStack{
         Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).font (
         .largeTitle)
         .foregroundStyle(<#T##style: ShapeStyle##ShapeStyle#>)
         Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
         /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
         }.buttonStyle(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Button Style@*/DefaultButtonStyle()/*@END_MENU_TOKEN@*/)(
         .borderedProminent)
         .font(.largeTitle)
         }
         }*/
    }
}

#Preview {
    SwiftUIZStack()
}
