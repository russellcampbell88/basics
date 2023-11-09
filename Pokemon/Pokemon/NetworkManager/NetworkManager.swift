//
//  NetworkManager.swift
//  Pokemon
//
//  Created by Russell Campbell on 11/8/23.
//

import Foundation


//  Async-await implementation for a network manager.
//  It's easier to implement-- you don't need a protocol delegate, etc.
protocol Networking
{
    
    //  Using await-async to perform API call.
    //  Remember that async and await are paired,
    //  so calling async is calling async-await
    func getDataFromNetworkLayer<T: Decodable>(url: URL, modelType:T.Type)
    async throws -> T
}

class NetworkManager: Networking {

    func getDataFromNetworkLayer<T>(url: URL, modelType: T.Type) async throws -> T where T : Decodable {
        //  Wrap API calls in do-try-catch
        do
        {
            let (data, _) = try await URLSession.shared.data( from: url )
            let parsedData = try JSONDecoder().decode( modelType, from: data )
            return parsedData
        }
        catch
        {
            throw error
        }
    }
    
}
