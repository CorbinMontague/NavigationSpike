//
//  SongView.swift
//  Music
//
//  Created by Corbin Montague on 7/1/24.
//

import SwiftUI

struct SongView: View {
    
    @StateObject var viewModel: SongViewModel
    
    var body: some View {
        VStack {
            Text("Song: \(viewModel.song.name)")
            
            Text("Artist: \(viewModel.song.artist.name)")
        }
    }
}
