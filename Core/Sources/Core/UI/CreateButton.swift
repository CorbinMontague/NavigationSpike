//
//  CreateButton.swift
//  Core
//
//  Created by Corbin Montague on 7/2/24.
//

import Foundation
import SwiftUI

public struct CreateButton: View {
    var action: (() -> Void)?
    
    public init(action: (() -> Void)? = nil) {
        self.action = action
    }
    
    public var body: some View {
        Image(systemName: "plus.square")
            .foregroundStyle(.green)
            .fontWeight(.bold)
            .onTapGesture {
                action?()
            }
    }
}
