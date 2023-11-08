//
//  DetailsScreen.swift
//  FirstSwiftUIApp
//
//  Created by Russell Campbell on 11/6/23.
//

import SwiftUI

struct DetailsScreen: View 
{
    //  Var to help us pass data from another screen
    //  to this one
    var data: String
    // @Environment ( \.colorScheme ) var colorScheme
    
    //  Binding Variables
    // @Binding var changeTitle: String
    //@Binding var isShown: Bool
    
    //  Environment Variables
    //@EnvironmentObject var user:UserInfo
    
    //  App Storage variables
    @AppStorage("UserNickName") var nickname = "UIKit"
    
    
    var body: some View
    {
        /*if colorScheme == .light {
            Text(data).foregroundStyle( .red )
        } else {
            Text(data).foregroundStyle( .green )
        }*/
        
        Text( data )
        
        /*Button("Change title for previous screen.") {
            changeTitle = "Title from 2nd screen."
        }*/
        
        /*Button("Dismiss") {
            
        }*/
        
        
        Text("Username: \(nickname)")
        
        //  Q: There's already a user deport. Why haven't they used AppStorage?
        //  A: 
    }
}

#Preview 
{
    DetailsScreen( data: "My Data" /*, changeTitle: .constant("ABC") */)
}
