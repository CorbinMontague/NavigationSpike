//
//  ViewModelFactory.swift
//
//
//  Created by Corbin Montague on 8/13/24.
//

import Core
import Foundation
import SwiftUI

struct ViewModelFactory {
    
    static func makeSongViewModel(song: Song) -> SongViewModel {
        return SongViewModel(song: song)
    }
    
    static func makeArtistViewModel(artist: Artist) -> ArtistViewModel {
        return ArtistViewModel(artist: artist)
    }
}
