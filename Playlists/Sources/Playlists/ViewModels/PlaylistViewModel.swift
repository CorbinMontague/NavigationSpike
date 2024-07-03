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
    
    init(playlist: Playlist) {
        self.playlist = playlist
    }
}
