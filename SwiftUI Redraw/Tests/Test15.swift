//
//  Test15.swift
//  SwiftUI Redraw
//
//  Created by anbushmanov on 02.01.2025.
//

import SwiftUI

// Проблема с навигацией и излишними зависимостями. Точно такая же история. Не стоит шарить такие штуки между экранами, это может привести не просто к потерях в производительности, но и к совершенно непредсказуемому поведению.

// Как пример, сейчас мы с вами сломаем стек навигации. Мы на последнем экране просто "уничтожили" линк, на которорм все держалось, и весь стек откатился в начало. Это довольно просто найти и объяснить глядя на вот такой утрированный пример, а вот когда у вас реальный боевой код, это выглядит не настолько очевидно.

// Что насчет NavigationStack ? Он уже гораздо более совершенен, чем NavigationView, и сломать его так просто не получится. Однако, экраны все так же будут перирисовываться, так как это не проблема навигации, а проблема излишних зависимостей

// Вывод. Не стоит шарить вью модели) Кстати если вы попытаетесь прокидывать вью модели через NavigationStack, он может перестать работать и будет кидать ошибки в консоль о том, что не стоит прокидывать ObservableObsect

final class Test15VieModel: ObservableObject {
    @Published var isTrue: Bool = true
}

struct Test15: View {
    
    @StateObject var viewModel = Test15VieModel()
    
    var body: some View {
        let _ = print("Screen 1")
        
        NavigationView {
            Group {
                if viewModel.isTrue {
                    NavigationLink {
                        Test15_1()
                    } label: {
                        Text("Next")
                    }
                } else {
                    NavigationLink {} label: { Text("Next") }
                }
            }
            .font(.system(size: 60.0))
            .navigationTitle("Screen 1")
        }
        .environmentObject(viewModel)
    }
}

struct Test15_1: View {
    
    @EnvironmentObject var viewModel: Test15VieModel
    
    var body: some View {
        let _ = print("Screen 2")
        
        NavigationLink {
            Test15_2()
        } label: {
            Text("Next")
                .font(.system(size: 60.0))
        }
        .navigationTitle("Screen 2")
    }
}


struct Test15_2: View {
    
    @EnvironmentObject var viewModel: Test15VieModel
    
    var body: some View {
        let _ = print("Screen 3")
        
        NavigationLink {
            Test15_3()
        } label: {
            Text("Next")
                .font(.system(size: 60.0))
        }
        .navigationTitle("Screen 3")
    }
}


struct Test15_3: View {
    
    @EnvironmentObject var viewModel: Test15VieModel
    
    var body: some View {
        let _ = print("Screen 4")
        
        TestButton {
            viewModel.isTrue.toggle()
        }
        .navigationTitle("Screen 4")
    }
}


#Preview {
    Test15()
}
