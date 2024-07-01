//
//  ArtistView.swift
//  Music
//
//  Created by Corbin Montague on 7/1/24.
//

import SwiftUI

struct ArtistView: View {
    
    @StateObject var viewModel: ArtistViewModel
    
    var body: some View {
        List {
            Text("Artist: \(viewModel.artist.name)")

            Section(header: Text("Songs")) {
                ForEach(0..<25) { index in
                    Text("Song \(index)")
                }
            }
        }
    }
}
