//
//  DestinationViewBuilder.swift
//  Music
//
//  Created by Corbin Montague on 6/30/22.
//

import Core
import Foundation
import SwiftUI

public class DestinationViewBuilder: ObservableObject {
    
    private var externalViewBuilder: SharedViewBuilding
    
    public init(externalViewBuilder: SharedViewBuilding) {
        self.externalViewBuilder = externalViewBuilder
    }
    
    @ViewBuilder func view(at destination: Destination) -> some View {
        switch destination {
        case .song(let song):
            ViewFactory.makeSongView(song: song)
        case .artist(let artist):
            ViewFactory.makeArtistView(artist: artist)
            
        case .external(let sharedDestination):
            externalViewBuilder.view(at: sharedDestination)
        }
    }
}
