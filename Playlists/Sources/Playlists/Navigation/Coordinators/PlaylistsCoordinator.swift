//
//  PlaylistsCoordinator.swift
//  Playlists
//
//  Created by Corbin Montague on 7/5/24.
//

import Core
import FlowStacks
import SwiftUI

class PlaylistsCoordinator: NavigationCoordinator {
    static let shared = PlaylistsCoordinator()
    
    @Published var path = FlowPath()
    
}
