//
//  ArtistView.swift
//  Music
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import FlowStacks
import SwiftUI

struct ArtistView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var navigator: FlowPathNavigator
    
    @StateObject var viewModel: ArtistViewModel
    
    var body: some View {
        List {
            Section(header: Text("Artist")) {
                Text("\(viewModel.artist.name)")
            }
            
            Section(header: Text("Songs")) {
                ForEach(viewModel.artist.songs, id: \.name) { song in
                    Text("\(song.name)")
                        .foregroundStyle(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            let destination = Destination.external(.song(song))
                            navigator.push(destination)
                        }
                }
            }
        }
        .navigationTitle("Artist Details")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                BackButton { dismiss() }
            }
        }
    }
}
