//
//  SongViewModel.swift
//  Music
//
//  Created by Corbin Montague on 7/1/24.
//

import Foundation
import SwiftUI

class SongViewModel: ObservableObject {
    
    @Published var song: Song
    
    init(song: Song) {
        self.song = song
    }
}
