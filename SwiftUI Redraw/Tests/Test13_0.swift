//
//  Test13_0.swift
//  SwiftUI Redraw
//
//  Created by anbushmanov on 12.01.2025.
//

import SwiftUI

// Бесполезные перирисовки от вью модели

final class Test13_0ViewModel: ObservableObject {
    @Published var title: String = ""
}

struct Test13_0: View {
    
    @StateObject var viewModel = Test13_0ViewModel()
    
    var body: some View {
        let _ = Self._printChanges()
        
        ZStack {
            Color.random
                .ignoresSafeArea()
            
            TestButton {
                viewModel.title = ""
            }
        }
    }
}

#Preview {
    Test13_0(viewModel: .init())
}
