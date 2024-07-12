//
//  SongCell.swift
//  Core
//
//  Created by Corbin Montague on 7/1/24.
//

import FlowStacks
import SwiftUI

// if we want to handle navigation within this shared view
public struct SongCell: View {
    @EnvironmentObject var navigator: FlowPathNavigator
    
    let song: Song
    
    public init(song: Song) {
        self.song = song
    }
    
    public var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(song.name)
                    .font(.body.bold())
                Text(song.artist.name)
                    .font(.footnote)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .contentShape(Rectangle())
        .onTapGesture {
            let screen = SharedScreen.song(song)
            navigator.push(screen)
        }
    }
}

// if we want to handle navigation within this shared view, but inject a Screen so it can differ between callers
//public struct SongCell<ScreenType: Hashable>: View {
//    @EnvironmentObject var navigator: FlowPathNavigator
//
//    let song: Song
//    let screen: ScreenType
//
//    public init(song: Song,
//                screen: ScreenType) {
//        self.song = song
//        self.screen = screen
//    }
//
//    public var body: some View {
//        HStack {
//            VStack(alignment: .leading, spacing: 8) {
//                Text(song.name)
//                    .font(.body.bold())
//                Text(song.artist.name)
//                    .font(.footnote)
//            }
//
//            Spacer()
//
//            Image(systemName: "chevron.right")
//        }
//        .frame(maxWidth: .infinity, alignment: .leading)
//        .contentShape(Rectangle())
//        .onTapGesture {
//            navigator.push(screen)
//        }
//    }
//}

// if we want to let the caller handle navigation
//public struct SongCell: View {
//
//    // these properties could be abstracted into a view model
//    let song: Song
//    var onTapped: (() -> Void)
//
//    public init(song: Song,
//                onTapped: @escaping (() -> Void)) {
//        self.song = song
//        self.onTapped = onTapped
//    }
//
//    public var body: some View {
//        HStack {
//            VStack(alignment: .leading, spacing: 8) {
//                Text(song.name)
//                    .font(.body.bold())
//                Text(song.artist.name)
//                    .font(.footnote)
//            }
//
//            Spacer()
//
//            Image(systemName: "chevron.right")
//        }
//        .frame(maxWidth: .infinity, alignment: .leading)
//        .contentShape(Rectangle())
//        .onTapGesture {
//            onTapped()
//        }
//    }
//}
