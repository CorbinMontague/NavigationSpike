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
    
    @Published var coordinator: CreatePlaylistCoordinator
    var onCreatePlaylist: ((Playlist) -> Void)
    
    init(coordinator: CreatePlaylistCoordinator,
         onCreatePlaylist: @escaping ((Playlist) -> Void)) {
        self.coordinator = coordinator
        self.onCreatePlaylist = onCreatePlaylist
    }
    
    func onCreatePlaylistTapped() {
        // let PlaylistsView know we created this playlist
        let newPlaylist = Playlist(name: playlistName, songs: songsToInclude)
        onCreatePlaylist(newPlaylist)
        
        // now dismiss back to PlaylistsView
        coordinator.path.dismiss()
    }
}
