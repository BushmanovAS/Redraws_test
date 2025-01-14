//
//  Test10.swift
//  SwiftUI Redraw
//
//  Created by anbushmanov on 29.12.2024.
//

import SwiftUI

// Перерисовки только для дочерней полноценной сабвью. Помимо профита с перерисовками, это положительно влияет на компилятор. Он горазло лучше воспринимает много маленьких файлов, чем один огромный. Так же все видели сообщение "не могу откомпилировать это в разумное время". Это в основном от большого body.

// Важный нюанс. Модификаторы, навешанные сверху, будут принадлежать родительской вью. Поэтому если у нас дочерняя вью часто перерисовывается, а родительская нет, то стоит вынести некоторые модификаторы наружу

struct Test10: View {

    @State private var counter: Int = 0

    var body: some View {
        ZStack {
            Color.random
            
            VStack {
                Test10_1(counter: $counter)
                
                TestButton {
                    counter += 1
                }
            }

        }
        .showGraph()
        .ignoresSafeArea()
    }
}

struct Test10_1: View {
    
    @Binding var counter: Int
    
//    let counter: Int
    
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
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 10.0))
        .frame(width: 300.0, height: 300.0)
    }
}

#Preview {
    Test10()
}
