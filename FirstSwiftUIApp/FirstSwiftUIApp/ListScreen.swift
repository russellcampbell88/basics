//
//  ListScreen.swift
//  FirstSwiftUIApp
//
//  Created by Russell Campbell on 11/6/23.
//

import SwiftUI

struct ListScreen: View {
    
    private let pokemonInPartyArray =
    ["Feraligatr","Ampharos","Mamoswine","Togekiss","Tyranitar","Dragonite"]
    
    let pokemonStorageArray =
    ["Box 1","Box 2","Box 3","Box 4","Box 5","Box 6","Box 7","Box 8"]
    
    var body: some View
    {
        //Text( /*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/ )
      
        VStack
        {
            //  List - show data in array
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
                    ForEach( pokemonInPartyArray, id: \.self )
                    {
                        pokemon in NavigationLink {
                            
                            // Switch statement for all the
                            // navigations to the Pokemon images
                            switch pokemon {
                                case "Feraligatr":
                                    FeraligatrImageDisplayView()
                                case "Ampharos":
                                    AmpharosImageDisplayView()
                                case "Mamoswine":
                                    MamoswineImageDisplayView()
                                case "Togekiss":
                                    TogekissImageDisplayView()
                                case "Tyranitar":
                                    TyranitarImageDisplayView()
                                case "Dragonite":
                                    DragoniteImageDisplayView()
                                default:                             DetailsScreen( data: pokemon )
                            }

                            

                        } label: {
                            ListCell( month: pokemon )
                            HStack{
                                Text(pokemon)
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
    NavigationStack {
        ListScreen()
    }
}
