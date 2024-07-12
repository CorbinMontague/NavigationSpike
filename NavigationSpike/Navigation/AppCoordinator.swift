//
//  AppCoordinator.swift
//  NavigationSpike
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import Explore
import Foundation
import Music
import Playlists
import SwiftUI

/// Handles navigation at the app-level.
class AppCoordinator: AppCoordinating, ObservableObject {
    static let shared = AppCoordinator()
    
    // MARK: - Dependencies
    
    // AppCoordinator needs a reference to each tab's NavigationCoordinator so it can delegate navigation logic to the correct module
    var exploreCoordinator: ExploreCoordinator? = nil
    var playlistsCoordinator: PlaylistsCoordinator? = nil
    
    // MARK: - Init
    
    init(selectedTab: Tab = .explore,
         exploreCoordinator: ExploreCoordinator? = nil,
         playlistsCoordinator: PlaylistsCoordinator? = nil) {
        self.selectedTab = selectedTab
        self.exploreCoordinator = exploreCoordinator
        self.playlistsCoordinator = playlistsCoordinator
    }
    
    // MARK: - AppCoordinating
    
    @Published var selectedTab: Tab {
        didSet {
            print("selectedTab: \(selectedTab)")
        }
    }
    
    @discardableResult func handle(url: URL) -> Bool {
        guard let deeplink = Deeplink(url: url) else {
            print("Warning: URL is not a supported Deeplink")
            return false
        }
        
        navigate(to: deeplink)
        return true
    }
    
    func navigate(to deeplink: Deeplink) {
        print("Navigating to: \(deeplink)")
        switch deeplink {
        case .explore:
            exploreCoordinator?.navigate(to: deeplink)
        case .playlists, .playlist:
            playlistsCoordinator?.navigate(to: deeplink)
        }
    }
}
