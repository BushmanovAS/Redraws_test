//
//  TestButton.swift
//  SwiftUI Redraw
//
//  Created by anbushmanov on 29.12.2024.
//

import SwiftUI

struct TestButton: View {
    
    private let action: () -> Void
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
           Text("Test")
                .font(.system(size: 30.0, weight: .semibold, design: .rounded))
                .foregroundStyle(.white)
                .padding(.horizontal, 30.0)
                .padding(30.0)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
        }
    }
}
