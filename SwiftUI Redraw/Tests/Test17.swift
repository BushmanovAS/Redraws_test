//
//  Test17.swift
//  SwiftUI Redraw
//
//  Created by anbushmanov on 02.01.2025.
//

import SwiftUI

// Во первых его лучше использовать как оверлей, а не бекграунд. Так как onPreferenceChange в некоторых версиях оси не считывает изменения из бекграунда, но работает с оверлеем. А во вторых вместо преф кея, лучше использовать таск
// Добавляем onChange из начала доклада, и наш скролл превращается в дискотеку. Проскроллив вниз/вверх один раз, мы на ровном месте получаем около 400 перерисовок, учитывая что мы получили их на ровном месте, это прям много. А ведь у нас тут не происходит загрузка из сети, рендер картинок и прочее. Там будет еще веселее. 
// В зависимости от задачи, мы всегда должны стараться свети количество перерисовок к минимуму. От 0 до необходимого нам числа. Как минимум превратив offset в Int, мы уже снизим количество перерисовок примерно в 3 раза, практически не меняя текущий, не самый лучший код через onChange.

struct Test17: View {
    
    @State private var offset = 0.0
    
    var body: some View {
        ZStack {
            Color.random
                .ignoresSafeArea()
            
            ScrollView {
                VStack {
                    Rectangle()
                        .fill(.white)
                        .frame(height: 100.0)
                        .overlay {
                            Text("0")
                                .font(.system(size: 60.0))
                        }
                        .scrollOffset { offset in
                            self.offset = offset
                        }
                    
                    TestList()
                }
            }
            .onChange(of: offset) {}
            .showGraph()
        }
    }
}

#Preview {
    Test17()
}
