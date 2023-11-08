//
//  ListScreen.swift
//  FirstSwiftUIApp
//
//  Created by Russell Campbell on 11/6/23.
//

import SwiftUI

struct ListScreen: View
{
    
    private let pokemonInPartyArray =
    //["Feraligatr","Ampharos",Togekiss","Mamoswine","Tyranitar","Dragonite"]
    
    ["Vicious","Agnus Dei","Angel","Joshua","Solomon","Victorious"]
    
    let pokemonStorageArray =
    ["Box 1","Box 2","Box 3","Box 4","Box 5","Box 6","Box 7","Box 8"]
    
    //  @EnvironmentObject var user: UserInfo
    
    //  We need this to avoid redundant views
    let pokemonImagesArray = [ "https://static.wikia.nocookie.net/legendsofthemultiuniverse/images/e/e1/160-Feraligatr.png/revision/latest?cb=20190315145749", "https://archives.bulbagarden.net/media/upload/c/c2/0181Ampharos.png",
        "https://archives.bulbagarden.net/media/upload/4/4c/0473Mamoswine.png",
        "https://archives.bulbagarden.net/media/upload/8/8f/0468Togekiss.png",
        "https://archives.bulbagarden.net/media/upload/0/09/0248Tyranitar.png",
        "https://pm1.aminoapps.com/6562/c327fb4bf4b8fcfa5dc2c0f1d3c8f15984f6e410_hq.jpg"
        ]
    //zip operator
    var combinedArray: [(String, String)] 
    {
        return Array(zip(pokemonInPartyArray, pokemonImagesArray))
    }
    
    var body: some View
    {
        //Text( /*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/ )
      
        VStack
        {
            //Text( user.userName )
            //Text( String( user.userID ) )
            
            //  List - show data in array.
            //  i.e. you have an array. Show its data in a
            //  list.
            
            //  id.\.self is kinda like a
            //  for loop
            
            //  Sections need to be INSIDE the list,
            //  Otherwise the cells will be
            //  center-justified
            List
            {
                //  MARK: Navigation to Images Display Views
                //  Here we navigate to views displaying images.
                Section( "Party Pokemon" ) {
                    ForEach( combinedArray, id: \.0 ) // zip array syntax
                    {
                        name, image in NavigationLink {
                            
                            CommonImageDisplay( imageURL: image )
                            
                        //  Display to the user
                        } label: {
                            ListCell( month: name )
                            
                            HStack
                            {
                                Text( name )
                            }
                        }
                        /*
                         day in HStack{
                         Image(systemName: "doc.on.doc.fill")
                         
                         (Text(day))
                         }
                         */
                    }
                }
                
                //  MARK: PASSED DATA - Pokemon Boxes
                //  Here we pass data from the Pokemon Storage System
                //  (specifically, which Box we selected)
                //  to the next screen.
                Section( "PKMN Box" )
                {
                    ForEach( pokemonStorageArray, id: \.self )
                    {
                        box in NavigationLink {
                            DetailsScreen( data: box )
                        } label: {
                            ListCell( month: box )
                            //  This is like our Cell
                            HStack {
                                // Image( systemName: "doc.on.doc.fill")
                                Text( box )
                            }
                        }
                        
                    }
                }
            }
            
            //  It's a 'List'
            //  In SwiftUI, not a
            //  TableView
            /*List(array, id: \.self)
             {
             
             //Print each day in the
             //  It's
             day in Text(day)
             }*/
            
            //List(array, id:\.self) {
            //  day in Text(day)
            //}
        }
    }
}

#Preview {
    
    NavigationStack 
    {
        ListScreen()
    }
}
