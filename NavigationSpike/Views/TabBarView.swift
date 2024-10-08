//
//  TabBarView.swift
//  NavigationSpike
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import Explore
import SwiftUI

struct TabBarView: View {
    
    @ObservedObject var coordinator: AppCoordinator
    let viewBuilder: SharedScreenViewBuilding
    
    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            Group {
                viewBuilder.view(for: .explore)
                    .tag(Tab.explore)
                    .tabItem {
                        Label("Explore", systemImage: "magnifyingglass")
                    }
                
                viewBuilder.view(for: .playlists)
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
