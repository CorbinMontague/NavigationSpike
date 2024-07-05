//
//  PlaylistsCoordinator.swift
//  Playlists
//
//  Created by Corbin Montague on 7/5/24.
//

import Core
import FlowStacks
import SwiftUI

public class PlaylistsCoordinator: NavigationCoordinator {
    static public let shared = PlaylistsCoordinator()
    
    @Published public var path = FlowPath()
    
}
