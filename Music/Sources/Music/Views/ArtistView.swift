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
    @EnvironmentObject var navigator: FlowPathNavigator
    
    @StateObject var viewModel: ArtistViewModel
    
    @State var routeStyle: RouteStyle = .push {
        didSet {
            print("ArtistView.routeStyle: \(routeStyle)")
        }
    }
    
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
            
            NavigationActionsView<Destination>()
        }
        .onAppear {
            if let style = navigator.routes.last?.style {
                self.routeStyle = style
            }
        }
        .navigationTitle("Artist Details")
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
