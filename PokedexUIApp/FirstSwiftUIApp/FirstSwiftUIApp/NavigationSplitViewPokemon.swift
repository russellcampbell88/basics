//
//  NavigationSplitView.swift
//  FirstSwiftUIApp
//
//  Created by Russell Campbell on 11/8/23.
//

import SwiftUI

struct NavigationSplitViewPokemon: View {
    
    //  Property Wrapper for the selected variable.
    //  It trackss which Pokemon we've selected in the sidebar
    @State var selected: String?
    
    private let pokemonInPartyArray = ["Feraligatr","Ampharos","Mamoswine","Togekiss","Tyranitar","Dragonite"]
    

    
    var body: some View {
        
        
        NavigationSplitView { // What shows up in our sidebar {
            
            List(pokemonInPartyArray, id:\.self, selection: $selected)
            {
                pokemon in Text(pokemon)
            }
        } detail: { //  What shows up in out rightside detail view
            
            if let selected = selected {
                DetailsScreen(data: selected)
            }
        }
        
    }
    
}

#Preview {
    NavigationSplitViewPokemon()
}
