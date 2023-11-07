//
//  ImagesDisplayView.swift
//  FirstSwiftUIApp
//
//  Created by Russell Campbell on 11/6/23.
//

import SwiftUI

struct DragoniteImageDisplayView: View {
    var body: some View {
        // Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        VStack {
            /*Image(systemName: "tennisball.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundStyle(.gray)*/
            
            // The Pokeball image
            AsyncImage(url: URL(string: "https://static.wikia.nocookie.net/pokemon-fano/images/6/6f/Poke_Ball.png/revision/latest?cb=20140520015336")!) { image in
                image.resizable()
                    .frame(width: 100, height: 100)
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            
            // The Dragonite Image
            AsyncImage(url: URL(string: "https://pm1.aminoapps.com/6562/c327fb4bf4b8fcfa5dc2c0f1d3c8f15984f6e410_hq.jpg")!) { image in
                image.resizable()
                    .frame(width: 400, height: 400)
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            
        }
    }
}


#Preview {
    DragoniteImageDisplayView()
}
