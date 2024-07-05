//
//  ContentView.swift
//  NavigationSpike
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import Explore
import SwiftUI

struct ContentView: View {
    
    @StateObject var coordinator = AppCoordinator.shared
    
    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            Group {
                coordinator.view(at: .explore)
                    .tag(Tab.explore)
                    .tabItem {
                        Label("Explore", systemImage: "magnifyingglass")
                    }
                
                coordinator.view(at: .playlists)
                    .tag(Tab.playlists)
                    .tabItem {
                        Label("Playlists", systemImage: "music.note.list")
                    }
            }
            .toolbarBackground(.white, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
        }
        .onOpenURL { url in
            guard let deeplink = Deeplink(url: url) else { return }
            coordinator.handle(deeplink: deeplink)
        }
    }
}
