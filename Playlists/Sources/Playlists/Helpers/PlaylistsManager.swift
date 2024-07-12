//
//  PlaylistsManager.swift
//  Playlists
//
//  Created by Corbin Montague on 7/12/24.
//

import Core
import Combine
import Foundation

class PlaylistsManager: PlaylistsManaging, ObservableObject {
    
    @Published var playlists: [Playlist]
    var playlistsPublisher: AnyPublisher<[Playlist], Never> {
        $playlists
            .share()
            .eraseToAnyPublisher()
    }
    
    init(playlists: [Playlist] = []) {
        self.playlists = playlists
    }
    
    func loadPlaylists() -> [Playlist] {
        // TODO
        return []
    }
    
    @discardableResult func deletePlaylist(playlistId: String) -> Bool {
        // TODO
        return false
    }
    
    @discardableResult func deleteSongFromPlaylist(songId: String, playlistId: String) -> Bool {
        // TODO
        return false
    }
}
