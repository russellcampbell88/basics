//
//  ImagesDisplayView.swift
//  FirstSwiftUIApp
//
//  Created by Russell Campbell on 11/6/23.
//

import SwiftUI

struct FeraligatrImageDisplayView: View {
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
            
            // The Feraligatr Image
            AsyncImage(url: URL(string: "https://static.wikia.nocookie.net/legendsofthemultiuniverse/images/e/e1/160-Feraligatr.png/revision/latest?cb=20190315145749")!)
            
           /* AsyncImage(url: URL(string: "https://picsum.photos/id/237/200/300")!) { image in image.resizable()
                    .frame(width: 200,height: 200)
                    .aspectRatio(contentMode: .fit)
                
            } placeholder: {
                ProgressView()
            }*/
        }
    }
}


#Preview {
    FeraligatrImageDisplayView()
}
