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
    ["Feraligatr","Ampharos","Togekiss","Momaswine","Tyranitar","Dragonite"]
    
    let pokeBoxArray = ["Box 1","Box 2","Box 3","Box 4"]
    
    var body: some View 
    {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        VStack {
            //  Make it scrollable
            ScrollView {
                LazyVGrid( columns: gridColumns ) {
                    Section( "1st Section" ) {
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
