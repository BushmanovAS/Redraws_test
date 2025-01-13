//
//  ContentView.swift
//  SwiftUI Redraw
//
//  Created by anbushmanov on 20.06.2024.
//

import SwiftUI

// Первый тест. Показывает перерисовки при изменениях текста на экране.

struct Test1: View {
    
    @State private var counter: Int = 0
    
    var body: some View {
        let _ = Self._printChanges()
        
        ZStack {
            Color.random
                .ignoresSafeArea()
            
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
        .showGraph()
    }
}

#Preview {
    Test1()
}
