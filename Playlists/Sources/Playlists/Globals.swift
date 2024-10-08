//
//  Globals.swift
//  Playlists
//
//  Created by Corbin Montague on 7/2/24.
//

import Core
import Foundation

public struct Globals {
    
    // MARK: - Deeplink Handler
    
    public static var deeplinkHandler: DeeplinkHandling?
    
    // MARK: - Deeplink Router
    
    public static var router: PlaylistsRouting?
    
    // MARK: - View Builder
    
    public static var viewBuilder: PlaylistsViewBuilder?
    
    // MARK: - Coordinators
    
    public static var coordinator = PlaylistsCoordinator()
}
