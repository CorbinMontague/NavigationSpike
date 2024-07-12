//
//  PlaylistsManaging.swift
//  Core
//
//  Created by Corbin Montague on 7/12/24.
//

import Combine
import Foundation

/// APIs for managing playlists.
public protocol PlaylistsManaging {
    var playlists: [Playlist] { get }
    var playlistsPublisher: AnyPublisher<[Playlist], Never> { get }
    

    @discardableResult func loadPlaylists() -> [Playlist]
    func addPlaylist(playlist: Playlist)
    @discardableResult func deletePlaylist(playlistId: String) -> Bool
    @discardableResult func deleteSongFromPlaylist(songId: String, playlistId: String) -> Bool
}

