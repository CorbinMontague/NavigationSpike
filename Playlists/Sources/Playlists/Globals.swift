//
//  Globals.swift
//  Playlists
//
//  Created by Corbin Montague on 7/2/24.
//

import Foundation

public struct Globals {
    public static let shared = Globals()
    
    public static var viewBuilder: DestinationViewBuilder?
    public static var router: PlaylistsRouter?
}
