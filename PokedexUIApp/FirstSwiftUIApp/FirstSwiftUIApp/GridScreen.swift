//
//  GridScreen.swift
//  FirstSwiftUIApp
//
//  Created by Russell Campbell on 11/6/23.
//

import SwiftUI

//  SwiftUI's version of CollectionView
struct GridScreen: View 
{
    
    private var gridColumns = [ GridItem(), GridItem()]
    let monthsArray =
    ["Vicious","Agnus Dei","Angel","Joshua","Solomon","Victorious"]
    
    let pokeBoxArray = ["Box 1","Box 2","Box 3","Box 4"]
    
    var body: some View 
    {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        VStack {
            //  Make it scrollable
            ScrollView {
                //  We're guaranteed that OS will only make memory for the
                //  Visible parts.
                LazyVGrid( columns: gridColumns ) {
                    Section( "1st Section" ) {
                        
                        //  We don't need a reusable identifier.
                        //  SwiftUI handles this fir us.
                        ForEach( monthsArray, id: \.self )
                        {
                            day in NavigationLink {
                                DetailsScreen( data: day )
                            } label: {
                                GridScreenCell(cellData: day)
                                    .frame( width: 100, height: 100)
                                /*HStack{
                                 Text(day)
                                 }*/
                            }
                            /*
                             day in HStack{
                             Image(systemName: "doc.on.doc.fill")
                             
                             (Text(day))
                             }
                             */
                        }
                    }
                }
                ScrollView ( .horizontal )
                {
                    //  Align cells horizontally
                    LazyHGrid( rows: gridColumns )
                    {
                        
                        ForEach( pokeBoxArray, id: \.self )
                        {
                            day in NavigationLink {
                                DetailsScreen( data: day )
                            } label: {
                                GridScreenCell(cellData: day)
                                    .frame( width: 200, height: 200)
                                /*HStack{
                                 Text(day)
                                 }*/
                            }
                            /*
                             day in HStack{
                             Image(systemName: "doc.on.doc.fill")
                             
                             (Text(day))
                             }
                             */
                        }
                    }
                }
                
            }
            
        }
    }
}

#Preview {
    GridScreen()
}
