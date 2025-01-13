//
//  Test11.swift
//  SwiftUI Redraw
//
//  Created by anbushmanov on 29.12.2024.
//

import SwiftUI

// Так же это будет работать и для дженериков. Убрали от сюда Binding, так как он был только для примера, и получаем тот же самый результат.

struct Test11<Content: View>: View {

    @ViewBuilder
    let content: () -> Content

    var body: some View {
        ZStack {
            Color.random

            content()
        }
        .ignoresSafeArea()
    }
}

struct Test11_1: View {
    
    @State private var counter: Int = 0
    
    var body: some View {
        ZStack {
            Color.random
            
            VStack {
                Text("Counter: \(counter)")
                    .font(.system(size: 30.0))
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10.0)
                            .fill(.white)
                    )
                
                TestButton {
                    counter += 1
                }
            }
        }
        .aspectRatio(1.0, contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: 10.0))
        .padding()
    }
}

#Preview {
    Test11 {
        Test11_1()
    }
}
