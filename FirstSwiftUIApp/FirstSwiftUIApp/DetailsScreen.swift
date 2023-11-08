//
//  DetailsScreen.swift
//  FirstSwiftUIApp
//
//  Created by Russell Campbell on 11/6/23.
//

import SwiftUI

struct DetailsScreen: View {
    //  Var to help us pass data from another screen
    //  to this one
    var data: String
    
    var body: some View {
        Text( data )
        
    }
}

#Preview 
{
    DetailsScreen( data: "My Data" )
}
