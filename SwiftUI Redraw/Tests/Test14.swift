//
//  Test14.swift
//  SwiftUI Redraw
//
//  Created by anbushmanov on 02.01.2025.
//

import SwiftUI

// Проблема с остуствием перерисовок, во вложенных объектах. Во первых, если вы видите у себя что-то такое, возможно, вы что-то делаете не так. Однако, если вы четко решили, что оно вам надо, то вот в чем причина. Паблишеры при своем изменении дергают метод objectWillChange, и это служит триггером для перерисовки тайтла, в данном случае. Тут у нас есть 2 варианта: вручную перерисовать вью, каким либо образом, либо вручную дернуть метод обновления у вью модели и тогда все будет работать.
// Новый @Observation тоже решает эту проблему

final class Test14VieModel: ObservableObject {
    @Published var title: String = "Test14"
    @Published var model = Test14Model()
}

final class Test14Model: ObservableObject {
    @Published var subtitle: String = "Nested model"
}

struct Test14: View {
    
    @StateObject var viewModel = Test14VieModel()
    
    var body: some View {
        ZStack {
            Color.random
                .ignoresSafeArea()
            
            VStack {
                Text(viewModel.title)
                
                Text(viewModel.model.subtitle)
                
                TestButton {
                    viewModel.title += "+"
                }
                
                TestButton {
                    viewModel.model.subtitle += "+"
                    viewModel.objectWillChange.send()
                }
            }
            .font(.system(size: 50.0))
        }
    }
}

#Preview {
    Test14()
}
