//
//  Test7.swift
//  SwiftUI Redraw
//
//  Created by anbushmanov on 29.12.2024.
//

import SwiftUI

// Тернарный оператор. В случае условия на сравнение, и изменении каунтера, экран будет постоянно ловить изменения, не смотря на то, что перерисовывать ему как бы ничего не надо. Вывод: выносим логику сравнения куда либо, и привязываем тернарный оператор к бульке.

struct Test7: View {
    
    @State private var counter: Int = 0
    
    var body: some View {
        ZStack {
            Color.random
                .ignoresSafeArea()
            
            VStack {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(.white)
                    .frame(
                        width: counter > 30 ? 100.0 : 200.0,
                        height: counter > 30 ? 100.0 : 200.0
                    )
                
                TestButton {
                    counter += 10
                }
            }
        }
    }
}

#Preview {
    Test7()
}
