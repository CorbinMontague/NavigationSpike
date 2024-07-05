//
//  PlaylistViewModel.swift
//  Playlists
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import Foundation
import SwiftUI

class PlaylistViewModel: ObservableObject {
    
    @Published var playlist: Playlist
    var onDeletePlaylist: ((Playlist) -> Void)
    
    init(playlist: Playlist,
         onDeletePlaylist: @escaping ((Playlist) -> Void)) {
        self.playlist = playlist
        self.onDeletePlaylist = onDeletePlaylist
    }
}
