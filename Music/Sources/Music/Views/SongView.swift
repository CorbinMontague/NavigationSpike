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
    
    @State var routeStyle: RouteStyle = .push {
        didSet {
            print("SongView.routeStyle: \(routeStyle)")
        }
    }
    
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
        .onAppear {
            if let style = navigator.routes.last?.style {
                self.routeStyle = style
            }
        }
        .navigationTitle("Song Details")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            switch routeStyle {
            case .push:
                ToolbarItem(placement: .topBarLeading) {
                    BackButton { navigator.goBack() }
                }
            case .cover:
                ToolbarItem(placement: .topBarTrailing) {
                    DismissButton { navigator.goBack() }
                }
            default:
                // we don't show any navigation toolbar buttons for sheet presentations
                ToolbarItem { }
            }
        }
    }
}
