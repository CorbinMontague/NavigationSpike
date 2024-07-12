//
//  PlaylistCell.swift
//  Playlists
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import FlowStacks
import SwiftUI

struct PlaylistCell: View {
    
    let playlist: Playlist
    let onPlaylistCellTapped: (() -> Void)
    
    var body: some View {
        HStack {
            Text("\(playlist.name)")
            
            Spacer()
            
            Text("# songs: \(playlist.songs.count)")
        }
        .foregroundStyle(.blue)
        .frame(maxWidth: .infinity, alignment: .leading)
        .contentShape(Rectangle())
        .onTapGesture {
            onPlaylistCellTapped()
        }
    }
}
