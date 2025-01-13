//
//  Test5.swift
//  SwiftUI Redraw
//
//  Created by anbushmanov on 29.12.2024.
//

import SwiftUI

// Перерисовки при изменении сразу нескольких параметров квадрата. Показывает, что триггерит перерисовку именно каунтер, а не модификаторы

struct Test5: View {
    
    @State private var counter: CGFloat = 0.0
    
    var body: some View {
        let _ = Self._printChanges()
        
        ZStack {
            Color.random
                .ignoresSafeArea()
            
            VStack {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(.white)
                    .frame(width: 200.0, height: 200.0 + counter)
                    .offset(CGSize(width: counter, height: 0.0))
                    .opacity(1.0 - (counter / 100.0))
                
                TestButton {
                    counter += 10
                }
            }
        }
    }
}

#Preview {
    Test5()
}
