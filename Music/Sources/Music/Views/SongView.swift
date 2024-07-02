//
//  SongView.swift
//  Music
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import FlowStacks
import SwiftUI

struct SongView: View {
    @EnvironmentObject var navigator: FlowPathNavigator
    
    @StateObject var viewModel: SongViewModel
    
    var body: some View {
        List {
            Section(header: Text("Song")) {
                Text("\(viewModel.song.name)")
            }
            
            Section(header: Text("Artist")) {
                Text("\(viewModel.song.artist.name)")
            }
            
            NavigationActionsView(destination: Destination.external(.artist(viewModel.song.artist)))
        }
        .flowDestination(for: Destination.self) { destination in
            Globals.viewBuilder?.view(at: destination)
        }
        .navigationTitle("Song Details")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            if navigator.routes.last?.isPresented == false {
                ToolbarItem(placement: .topBarLeading) {
                    BackButton { navigator.goBack() }
                }
            } else {
                ToolbarItem(placement: .topBarTrailing) {
                    DismissButton { navigator.goBack() }
                }
            }
        }
    }
}
