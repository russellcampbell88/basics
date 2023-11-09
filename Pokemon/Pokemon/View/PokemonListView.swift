//
//  ContentView.swift
//  Pokemon
//
//  Created by Russell Campbell on 11/8/23.
//

import SwiftUI

struct PokemonListView: View {
    
    //  Call the NetworkManager for the API call
    var networkManager = NetworkManager()
    @State var pokemonListArray = [Pokemon]()
    
    
    var body: some View { 

        VStack {
            List (pokemonListArray) { pokemon in
                Text( pokemon.id )
                Text( pokemon.name )
            }
                
                   
        }
        .padding()
        .onAppear {
            
            Task 
            {
                pokemonListArray = try await networkManager.getDataFromNetworkLayer(url: URL(string:APIEndPoints.pokemonEndPoint)!, modelType: [Pokemon].self)
            }
            
        }
    }
}

#Preview {
    PokemonListView()
}
