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
    var onCreatePlaylist: ((Playlist) -> Void)
    
    init(onCreatePlaylist: @escaping ((Playlist) -> Void)) {
        self.onCreatePlaylist = onCreatePlaylist
    }
    
    func onCreatePlaylistTapped() {
        // create new playlist with a random song
        var newPlaylist = Playlist(name: playlistName)
        
        if let randomSong = Song.makeAllSongs().randomElement() {
            newPlaylist.songs = [randomSong]
        }
        
        onCreatePlaylist(newPlaylist)
    }
}
