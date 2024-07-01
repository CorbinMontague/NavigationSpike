//
//  ContentView.swift
//  NavigationSpike
//
//  Created by Corbin Montague on 7/1/24.
//

import Explore
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")
                }
            
            Text("Hello Playlists")
                .tabItem {
                    Label("Playlists", systemImage: "music.note.list")
                }
        }
    }
}

#Preview {
    ContentView()
}
