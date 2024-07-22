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
    @Environment(\.routeStyle) var routeStyle: RouteStyle?
    @Environment(\.routeIndex) var routeIndex
    
    @StateObject var viewModel: ArtistViewModel
    
    var body: some View {
        List {
            Section(header: Text("Artist")) {
                Text("\(viewModel.artist.name)")
            }
            
            Section(header: Text("Songs")) {
                ForEach(viewModel.artist.songs, id: \.id) { song in
                    Text("\(song.name)")
                        .foregroundStyle(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            let screen = Screen.external(.song(song))
                            navigator.push(screen)
                        }
                }
            }
            
            NavigationActionsView<Screen>()
        }
        .navigationTitle("Artist Details")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            // Tip
            // We could pass in an `isModal` Bool instead of using the route style and index if we want
            
            // render a back button if this view was pushed
            if let routeStyle = routeStyle, routeStyle.isPush {
                ToolbarItem(placement: .topBarLeading) {
                    BackButton { navigator.pop() }
                }
            }
            
            // render a dismiss button if this view was presented or was pushed by a view contained within a modal
            if let routeStyle = routeStyle, routeStyle.isSheet || routeStyle.isCover {
                ToolbarItem(placement: .topBarTrailing) {
                    DismissButton { navigator.dismiss() }
                }
            } else if navigator.isRouteInModal(routeIndex: routeIndex) {
                ToolbarItem(placement: .topBarTrailing) {
                    DismissButton { navigator.dismiss() }
                }
            }
        }
    }
}
