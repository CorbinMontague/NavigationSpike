//
//  PlaylistsCoordinator.swift
//  Playlists
//
//  Created by Corbin Montague on 7/5/24.
//

import Core
import FlowStacks
import SwiftUI

final public class PlaylistsCoordinator: NavigationCoordinator, ObservableObject {
    
    @Published public var path: FlowPath {
        didSet {
            print("PlaylistsCoordinator.path: \(path)")
        }
    }
    
    public init(path: FlowPath = FlowPath()) {
        self.path = path
    }
}
