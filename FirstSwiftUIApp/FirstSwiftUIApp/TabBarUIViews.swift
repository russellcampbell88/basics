//
//  TabBarUIViews.swift
//  FirstSwiftUIApp
//
//  Created by Russell Campbell on 11/8/23.
//

import SwiftUI

struct TabBarUIViews: View {
    var body: some View {
        TabView {
            ListScreen()
                .tabItem {
                    Image(systemName: "folder.fill")
                    Text("PKMN")
                }
            
            SwiftUIWebView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Johto Map")
                }
            
            GridScreen()
                .tabItem {
                    
                    Image(systemName: "square.grid.3x3.middleleft.fill")
                    Text("Grid View")
                }
        }
    }
}

#Preview {
    TabBarUIViews()
}
