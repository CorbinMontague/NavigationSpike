//
//  ContentView.swift
//  NavigationSpike
//
//  Created by Corbin Montague on 7/1/24.
//

import Explore
import Navigation
import SwiftUI

enum Tab: Hashable {
    case explore
    case playlists
}

struct ContentView: View {
    private var viewBuilder: SharedViewBuilding = AppViewBuilder()
    
    @State var selectedTab: Tab = .explore
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Group {
                viewBuilder.view(at: .explore)
                    .tag(Tab.explore)
                    .tabItem {
                        Label("Explore", systemImage: "magnifyingglass")
                    }
                
                viewBuilder.view(at: .playlists)
                    .tag(Tab.playlists)
                    .tabItem {
                        Label("Playlists", systemImage: "music.note.list")
                    }
            }
            .toolbarBackground(.white, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
        }
    }
}
