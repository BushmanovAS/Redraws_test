//
//  Test7_1.swift
//  SwiftUI Redraw
//
//  Created by anbushmanov on 11.01.2025.
//

import SwiftUI

struct Test7_1: View {
    
    @State private var counter: Int = 1
    
    var body: some View {
        if counter > 0 {
            ZStack {
                Color.random
                    .ignoresSafeArea()
                
                TestButton {
                    counter += 10
                }
            }
        }
    }
}

#Preview {
    Test7_1()
}
