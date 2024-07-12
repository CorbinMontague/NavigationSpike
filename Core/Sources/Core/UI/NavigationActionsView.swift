//
//  NavigationActionsView.swift
//  Core
//
//  Created by Corbin Montague on 7/2/24.
//

import FlowStacks
import SwiftUI

public struct NavigationActionsView<ScreenType: Hashable>: View {
    @EnvironmentObject var navigator: FlowPathNavigator
    
    @State var goBackNum: Int = 2
    @State var popNum: Int = 2
    var screen: ScreenType?
    
    public init(screen: ScreenType? = nil) {
        self.screen = screen
    }
    public var body: some View {
        
        if let screen = self.screen {
            Section(header: Text("Push")) {
                Text("Push")
                    .foregroundStyle(.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        navigator.push(screen)
                    }
            }
            
            Section(header: Text("Present")) {
                Text("Present Sheet")
                    .foregroundStyle(.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        navigator.presentSheet(screen, withNavigation: true)
                    }
                
                Text("Present Cover")
                    .foregroundStyle(.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        navigator.presentCover(screen, withNavigation: true)
                    }
            }
        }
        
        Section(header: Text("Go Back")) {
            Text("Go Back")
                .foregroundStyle(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
                .contentShape(Rectangle())
                .onTapGesture {
                    navigator.goBack()
                }
            
            HStack {
                Text("Go Back (\(goBackNum))")
                    .foregroundStyle(.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        navigator.goBack(goBackNum)
                    }
                
                Stepper(label: { EmptyView() },
                        onIncrement: { goBackNum += 1 },
                        onDecrement: { goBackNum = max(1, goBackNum - 1) }
                )
            }
            
            Text("Go Back to Root")
                .foregroundStyle(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
                .contentShape(Rectangle())
                .onTapGesture {
                    navigator.goBackToRoot()
                }
        }
        
        Section(header: Text("Pop")) {
            Text("Pop")
                .foregroundStyle(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
                .contentShape(Rectangle())
                .onTapGesture {
                    navigator.pop()
                }
            
            HStack {
                Text("Pop (\(popNum))")
                    .foregroundStyle(.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        navigator.pop(popNum)
                    }
                
                Stepper(label: { EmptyView() },
                        onIncrement: { popNum += 1 },
                        onDecrement: { popNum = max(1, popNum - 1) }
                )
            }
            
            Text("Pop to Root")
                .foregroundStyle(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
                .contentShape(Rectangle())
                .onTapGesture {
                    navigator.popToRoot()
                }
            
            Text("Pop to Current Navigation Root")
                .foregroundStyle(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
                .contentShape(Rectangle())
                .onTapGesture {
                    navigator.popToCurrentNavigationRoot()
                }
        }
        
        Section(header: Text("Dismiss")) {
            Text("Dismiss")
                .foregroundStyle(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
                .contentShape(Rectangle())
                .onTapGesture {
                    navigator.dismiss()
                }
            
            Text("Dismiss All")
                .foregroundStyle(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
                .contentShape(Rectangle())
                .onTapGesture {
                    navigator.dismissAll()
                }
        }
    }
}
