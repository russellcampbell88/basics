//
//  PokemonListViewModel.swift
//  Pokemon
//
//  Created by Russell Campbell on 11/8/23.
//

import Foundation

class PokemonViewListModel:ObservableObject
{
    var network  = NetworkManager()
    @Published var pokemonListArray = [Pokemon]()
    

        func getDataFromviewModel() async
        {
            do {
                let pokemonListArray = try await network.getDataFromNetworkLayer(url: URL(string:APIEndPoints.pokemonEndPoint)!, modelType: [Pokemon].self)
            } catch {
                print(error.localizedDescription)
            }
    }
}
