//
//  SongCell.swift
//  Core
//
//  Created by Corbin Montague on 7/1/24.
//

import FlowStacks
import SwiftUI

public struct SongCell<DestinationType: Hashable>: View {
    @EnvironmentObject var navigator: FlowPathNavigator
    
    let song: Song
    let destination: DestinationType
    
    public init(song: Song,
                destination: DestinationType) {
        self.song = song
        self.destination = destination
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(song.name)
                .font(.body.bold())
            Text(song.artist.name)
                .font(.footnote)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .contentShape(Rectangle())
        .onTapGesture {
            navigator.push(destination)
        }
    }
}
