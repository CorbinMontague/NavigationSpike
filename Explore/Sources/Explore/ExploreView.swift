//
//  ExploreView.swift
//  Explore
//
//  Created by Corbin Montague on 7/1/24.
//

import SwiftUI

public struct ExploreView: View {
    
    public init() { }
    public var body: some View {
        List {
            ForEach(0..<25) { index in
                Text("Song \(index)")
            }
        }
    }
}

#Preview {
    ExploreView()
}
