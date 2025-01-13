//
//  GeometryReaderModifier.swift
//  SwiftUI Redraw
//
//  Created by anbushmanov on 03.01.2025.
//

import SwiftUI

struct ScrollOffsetReaderModifier: ViewModifier {
    
    let action: (CGFloat) -> Void
    
    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { geo in
                    Color.clear
                        .task(id: geo.frame(in: .scrollView)) {
                            action(geo.frame(in: .scrollView).minY)
                        }
                }
            )
    }
}

extension View {
    func scrollOffset(action: @escaping (CGFloat) -> Void) -> ModifiedContent<Self, ScrollOffsetReaderModifier> {
        modifier(ScrollOffsetReaderModifier(action: action))
    }
}

// Этот вариант расширения превращает любую View в AnyView
//
//extension View {
//    func scrollOffset(action: @escaping (CGFloat) -> Void) -> some View {
//        modifier(ScrollOffsetReaderModifier(action: action))
//    }
//}
