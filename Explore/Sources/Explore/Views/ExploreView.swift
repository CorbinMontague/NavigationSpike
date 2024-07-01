//
//  ExploreView.swift
//  Explore
//
//  Created by Corbin Montague on 7/1/24.
//

import SwiftUI

public struct ExploreView: View {
    
    @StateObject var viewModel = ExploreViewModel()
    
    public init() { }
    public var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.songs, id: \.name) { song in
                    Text(song.name)
                }
            }
            .navigationTitle("Explore")
        }
    }
}
