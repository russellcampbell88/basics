//
//  ListCell.swift
//  FirstSwiftUIApp
//
//  Created by Russell Campbell on 11/6/23.
//

import SwiftUI

struct ListCell: View {
    
    var month: String
    
    var body: some View {
        HStack {
            Image(systemName: "book.closed.fill")
                .foregroundColor( .red )
            
            //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    ListCell( month: "Day" )
}
