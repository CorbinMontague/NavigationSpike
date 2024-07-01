//
//  ArtistViewModel.swift
//  Music
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import Foundation
import SwiftUI

class ArtistViewModel: ObservableObject {
    
    @Published var artist: Artist
    
    init(artist: Artist) {
        self.artist = artist
    }
}
