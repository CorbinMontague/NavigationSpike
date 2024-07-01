//
//  ExploreViewModel.swift
//  Music
//
//  Created by Corbin Montague on 7/1/24.
//

import Music
import SwiftUI

class ExploreViewModel: ObservableObject {
    
    @Published var songs: [Song]
    
    init(songs: [Song] = Song.makeAllSongs()) {
        self.songs = songs
    }
}
