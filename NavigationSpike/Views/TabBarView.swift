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
    let viewBuilder: SharedViewBuilding
    
    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
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
