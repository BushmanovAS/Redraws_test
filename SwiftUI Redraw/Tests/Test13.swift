//
//  Test13.swift
//  SwiftUI Redraw
//
//  Created by anbushmanov on 01.01.2025.
//

import SwiftUI

// Environment и ObservadObject. Интересный слайд. Несмотря на объем кода, тут много всего интересного.
// Начнем с того, что вью модель инициализируется прямо на вью, это не есть гуд, чем сильнее мы раздуваем инит вьюхи, тем дольше она грузится. Все данные на вью лучше передавать уже в готовом виде
// Во вью модели есть бесполезный паблишер, это сабтайтл. Не стоит создавать 100500 паблишеров, это бьет по перформансу, и обычно в это просто нет необходимости
// Простейшее изменение сабтайтла, обновляет вью модель, что в свою очередь перерисовывает представление целиком, хотя в этом нет никакой необходимости.
// Так же излишняя зависимость, Test13_1, заставляет и ее перерисовываться тоже, хотя в этом нет вообще никакой необходимости
// Из интересного. Сабвью не перерисовывается, потому что работает Equatable "под капотом". Это не задокументированное поведение, на него не стоит рассчитывать, оно может измениться в любой момент
// Все вышесказанное точно так же работает и для Environment.

// Мы можем вместо паблишера использовать комбайн, превратить subtitle в CurrentValueSubject, и работать с ним через send и receive, тогда оно не будет триггерить перерисовки почем зря, но это тоже такое себе решение конечно)

final class Test13ViewModel: ObservableObject {
    @Published var title: String = "Test13"
    @Published var subtitle: String = ""
}

struct Test13: View {
    
    @StateObject var viewModel = Test13ViewModel()
    
    var body: some View {
        let _ = Self._printChanges()
        
        ZStack {
            Color.random
                .ignoresSafeArea()
            
            VStack(spacing: 50.0) {
                Text(viewModel.title)
                    .font(.system(size: 80.0))
                
                Test13_1(title: viewModel.title)
                
                TestButton {
                    viewModel.subtitle += "+"
                }
            }
        }
        .showGraph()
    }
}

struct Test13_1: View {
    
    let title: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10.0)
            .fill(Color.random)
            .frame(width: 300.0, height: 200.0)
            .overlay {
                Text(title)
                    .font(.system(size: 30.0))
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10.0)
                            .fill(.white)
                    )
            }
    }
}

#Preview {
    Test13()
}
