//
//  SongView.swift
//  Music
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import SwiftUI

struct SongView: View {
    
    @StateObject var viewModel: SongViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(viewModel.song.name)
                .font(.body.bold())
            
            Text(viewModel.song.artist.name)
                .font(.footnote)
                .foregroundStyle(.blue)
                .onTapGesture {
                    // TODO: Push ArtistView
                }
        }
    }
}
