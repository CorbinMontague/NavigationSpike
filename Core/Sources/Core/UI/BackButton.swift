//
//  BackButton.swift
//  Core
//
//  Created by Corbin Montague on 7/1/24.
//

import Foundation
import SwiftUI

public struct BackButton: View {
    var action: (() -> Void)?
    
    public init(action: (() -> Void)? = nil) {
        self.action = action
    }
    
    public var body: some View {
        Image(systemName: "chevron.backward.circle")
            .foregroundStyle(.blue)
            .onTapGesture {
                action?()
            }
    }
}
