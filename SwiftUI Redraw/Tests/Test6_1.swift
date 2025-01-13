//
//  Test6_1.swift
//  SwiftUI Redraw
//
//  Created by anbushmanov on 05.01.2025.
//

import SwiftUI

// onChange генерит перирисовки без всяких действий

struct Test6_1: View {
    
    @State private var counter = 0
    
    var body: some View {
        ZStack {
            Color.random
                .ignoresSafeArea()
            
            TestButton {
                counter += 1
            }
        }
        .onChange(of: counter) {}
    }
}

#Preview {
    Test6_1()
}
