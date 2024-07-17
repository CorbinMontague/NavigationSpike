//
//  CreatePlaylistCoordinator.swift
//  Playlists
//
//  Created by Corbin Montague on 7/5/24.
//

import Core
import FlowStacks
import SwiftUI

final public class CreatePlaylistCoordinator: NavigationCoordinator, ObservableObject {
    
    @Published public var path = FlowPath()
    public weak var appCoordinator: AppCoordinating?
}
