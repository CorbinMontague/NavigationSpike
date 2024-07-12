//
//  ScreenViewBuilder.swift
//  Music
//
//  Created by Corbin Montague on 6/30/22.
//

import Core
import Foundation
import SwiftUI

public class ScreenViewBuilder {
    private var externalViewBuilder: SharedViewBuilding
    
    public init(externalViewBuilder: SharedViewBuilding) {
        self.externalViewBuilder = externalViewBuilder
    }
    
    @ViewBuilder func view(for screen: Screen) -> some View {
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
