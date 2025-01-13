//
//  Test4.swift
//  SwiftUI Redraw
//
//  Created by anbushmanov on 29.12.2024.
//

import SwiftUI

// Перерисовки при оффсете

struct Test4: View {
    
    @State private var counter: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            Color.random
                .ignoresSafeArea()
            
            VStack {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(.white)
                    .frame(width: 200.0, height: 200.0)
                    .offset(CGSize(width: counter, height: 0.0))
                    .opacity(0.0)
                
                TestButton {
                    counter += 30
                }
            }
        }
    }
}

#Preview {
    Test4()
}
