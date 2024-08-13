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
    
    // MARK: - Internal Views
    
    static func makeSongView(song: Song) -> SongView {
        let viewModel = ViewModelFactory.makeSongViewModel(song: song)
        return SongView(viewModel: viewModel)
    }
    
    static func makeArtistView(artist: Artist) -> ArtistView {
        let viewModel = ViewModelFactory.makeArtistViewModel(artist: artist)
        return ArtistView(viewModel: viewModel)
    }
    
    // MARK: - Cross-Module Views
    
    public static func makeSongAnyView(song: Song) -> AnyView {
        let view = makeSongView(song: song)
        return AnyView(view)
    }
    
    public static func makeArtistAnyView(artist: Artist) -> AnyView {
        let view = makeArtistView(artist: artist)
        return AnyView(view)
    }
}
