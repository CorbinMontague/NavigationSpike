//
//  CreatePlaylistViewModel.swift
//  Playlists
//
//  Created by Corbin Montague on 7/5/24.
//

import Core
import Foundation

class CreatePlaylistViewModel: ObservableObject {
    
    @Published var playlistName: String = ""
    @Published var songsToInclude: [Song] = []
    @Published var songsToAdd: [Song] = Song.makeAllSongs()
    
    var onCreatePlaylist: ((Playlist) -> Void)
    
    init(onCreatePlaylist: @escaping ((Playlist) -> Void)) {
        self.onCreatePlaylist = onCreatePlaylist
    }
    
    func onCreatePlaylistTapped() {
        var newPlaylist = Playlist(name: playlistName, songs: songsToInclude)
        onCreatePlaylist(newPlaylist)
    }
}
