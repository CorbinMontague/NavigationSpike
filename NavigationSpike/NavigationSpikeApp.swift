//
//  NavigationSpikeApp.swift
//  NavigationSpike
//
//  Created by Corbin Montague on 7/1/24.
//

import Explore
import Music
import SwiftUI

@main
struct NavigationSpikeApp: App {
    
    // prefer to use a DI library like:
    // - https://github.com/hmlongco/Resolver
    // - https://github.com/hmlongco/Factory
    init() {
        let appViewBuilder = AppViewBuilder.shared
        Explore.Globals.viewBuilder = Explore.DestinationViewBuilder(externalViewBuilder: appViewBuilder)
        Music.Globals.viewBuilder = Music.DestinationViewBuilder(externalViewBuilder: appViewBuilder)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
