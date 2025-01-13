//
//  Test8.swift
//  SwiftUI Redraw
//
//  Created by anbushmanov on 29.12.2024.
//

import SwiftUI

// Вывод: presentation слой не должен этим заниматься, выносим логику сравнения куда либо, и привязываем тернарный оператор к бульке.

// По тем же причинам стоит с осторожностью использовать в коде if/else и switch внутри body

struct Test8: View {
    
    @State private var counter: CGFloat = 0.0
    @State private var condition: Bool = false
    
    var body: some View {
        ZStack {
            Color.random
                .ignoresSafeArea()
            
            VStack {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(.white)
                    .frame(
                        width: condition ? 100.0 : 200.0,
                        height: condition ? 100.0 : 200.0
                    )
                
                TestButton {
                    counter += 10
                    checkSize()
                }
            }
        }
    }
    
    func checkSize() {
        condition = counter > 30
    }
}

#Preview {
    Test8()
}
