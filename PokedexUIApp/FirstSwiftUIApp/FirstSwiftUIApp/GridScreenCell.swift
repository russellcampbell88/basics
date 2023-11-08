//
//  GridScreenCell.swift
//  FirstSwiftUIApp
//
//  Created by Russell Campbell on 11/6/23.
//

import SwiftUI

struct GridScreenCell: View {
    
    let cellData: String
    
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        // Square box in SwiftUI
        RoundedRectangle(cornerRadius: 10.0 )
            .fill( .black )
            .overlay() {
                VStack{
                    Image(systemName: "person.crop.circle.fill")
                        .font( .title )
                        .foregroundStyle( .red )
                    Text(cellData)
                        .font( .title2 )
                        .foregroundStyle(.red)
                }
            }
            .frame( width: 100, height: 100 )
    }
}

#Preview {
    GridScreenCell( cellData: "Cell Data")
}
