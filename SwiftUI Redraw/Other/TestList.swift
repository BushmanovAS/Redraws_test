//
//  TestList.swift
//  SwiftUI Redraw
//
//  Created by anbushmanov on 03.01.2025.
//

import SwiftUI

struct TestList: View {
    var body: some View {
        ForEach(1..<100) { index in
            Rectangle()
                .fill(.white.opacity(0.5))
                .frame(height: 100.0)
                .overlay {
                    Text("\(index)")
                        .font(.system(size: 60.0))
                        .frame(maxWidth: .infinity)
                }
        }
    }
}

#Preview {
    TestList()
}
