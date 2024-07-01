//
//  ViewFactory.swift
//  Music
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import Foundation
import SwiftUI

public struct ViewFactory {
    static public func makeSongView(song: Song) -> AnyView {
        let viewModel = SongViewModel(song: song)
        return AnyView(SongView(viewModel: viewModel))
    }
    
    static public func makeArtistView(artist: Artist) -> AnyView {
        let viewModel = ArtistViewModel(artist: artist)
        return AnyView(ArtistView(viewModel: viewModel))
    }
}
