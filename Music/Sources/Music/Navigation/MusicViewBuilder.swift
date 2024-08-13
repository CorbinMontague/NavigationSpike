//
//  MusicViewBuilder.swift
//  Music
//
//  Created by Corbin Montague on 6/30/22.
//

import Core
import Foundation
import SwiftUI

public class MusicViewBuilder: ModuleScreenViewBuilding {
    public typealias ScreenCase = Screen
    
    private var externalViewBuilder: SharedScreenViewBuilding
    
    public init(externalViewBuilder: SharedScreenViewBuilding) {
        self.externalViewBuilder = externalViewBuilder
    }
    
    @ViewBuilder public func view(for screen: Screen) -> some View {
        switch screen {
        case .song(let song):
            ViewFactory.makeSongView(song: song)
        case .artist(let artist):
            ViewFactory.makeArtistView(artist: artist)
            
        case .external(let sharedScreen):
            externalViewBuilder.view(for: sharedScreen)
        }
    }
}
