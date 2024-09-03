//
//  CreatePlaylistCoordinator.swift
//  Playlists
//
//  Created by Corbin Montague on 7/5/24.
//

import Combine
import Core
import FlowStacks
import SwiftUI

final public class CreatePlaylistCoordinator: NavigationCoordinating {
    
    @Published public var path = FlowPath()
    public var pathPublisher: AnyPublisher<FlowPath, Never> {
        return $path.eraseToAnyPublisher()
    }
}
