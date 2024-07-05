//
//  PlaylistsCoordinator.swift
//  Playlists
//
//  Created by Corbin Montague on 7/5/24.
//

import FlowStacks
import SwiftUI

class PlaylistsCoordinator: ObservableObject {
    static let shared = PlaylistsCoordinator()
    
    @Published var path = FlowPath()
    
}
