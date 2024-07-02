//
//  NavigationActionsView.swift
//  Core
//
//  Created by Corbin Montague on 7/2/24.
//

import FlowStacks
import SwiftUI

public struct NavigationActionsView<DestinationType: Hashable>: View {
    @EnvironmentObject var navigator: FlowPathNavigator
    
    @State var goBackNum: Int = 2
    @State var popNum: Int = 2
    var destination: DestinationType?
    
    public init(destination: DestinationType? = nil) {
        self.destination = destination
    }
    public var body: some View {
        
        if let destination = self.destination {
            Section(header: Text("Push")) {
                Text("Push")
                    .foregroundStyle(.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        navigator.push(destination)
                    }
            }
            
            Section(header: Text("Present")) {
                Text("Present Sheet")
                    .foregroundStyle(.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        navigator.presentSheet(destination, withNavigation: true)
                    }
                
                Text("Present Cover")
                    .foregroundStyle(.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        navigator.presentCover(destination, withNavigation: true)
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
