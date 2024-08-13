//
//  AppCoordinator.swift
//  NavigationSpike
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import Combine
import Explore
import Foundation
import Music
import Playlists
import SwiftUI

/// Handles navigation at the app-level.
final class AppCoordinator: AppCoordinating, ObservableObject {
    static let shared = AppCoordinator()
    
    // MARK: - Dependencies
    
    var exploreCoordinator: ExploreCoordinator
    var playlistsCoordinator: PlaylistsCoordinator
    
    // MARK: - Init
    
    init(selectedTab: Tab = .explore,
         exploreCoordinator: ExploreCoordinator = Explore.Globals.coordinator,
         playlistsCoordinator: PlaylistsCoordinator = Playlists.Globals.coordinator) {
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
    var selectedTabPublisher: AnyPublisher<Tab, Never> { $selectedTab.eraseToAnyPublisher() }
    
    func dismissAll() {
        // If there's an app-level modal presenter, tell it to dismiss all modals
//        modalPresenter.dismissAll()
        
        // Tell each root view to dismiss any modals they may be currently presenting
        exploreCoordinator.path.dismissAll()
        playlistsCoordinator.path.dismissAll()
    }
}
