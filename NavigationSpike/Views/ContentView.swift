//
//  ContentView.swift
//  NavigationSpike
//
//  Created by Corbin Montague on 7/1/24.
//

import Explore
import Navigation
import SwiftUI

struct ContentView: View {
    private var viewBuilder: SharedViewBuilding = AppViewBuilder()
    
    var body: some View {
        TabView {
            Group {
                viewBuilder.view(for: .explore)
                    .tabItem {
                        Label("Explore", systemImage: "magnifyingglass")
                    }
                    .environmentObject(Explore.DestinationViewBuilder(externalViewBuilder: viewBuilder))
                
                viewBuilder.view(for: .playlists)
                    .tabItem {
                        Label("Playlists", systemImage: "music.note.list")
                    }
            }
            .toolbarBackground(.white, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
        }
    }
}
