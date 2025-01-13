//
//  Test2.swift
//  SwiftUI Redraw
//
//  Created by anbushmanov on 29.12.2024.
//

import SwiftUI

// Перерисовки при изменении фрейма

struct Test2: View {
    
    @State private var counter: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            Color.random
                .ignoresSafeArea()
            
            VStack {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(.white)
                    .frame(
                        width: 200.0 + counter,
                        height: 200.0 + counter
                    )
                
                TestButton {
                    counter += 10
                }
            }
        }
    }
}

#Preview {
    Test2()
}
