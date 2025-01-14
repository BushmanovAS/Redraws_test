//
//  Test13_2.swift
//  SwiftUI Redraw
//
//  Created by anbushmanov on 13.01.2025.
//

import SwiftUI
import Combine


final class Test13_2ViewModel: ObservableObject {
    @Published var title: String = "Test13"
    var subject: CurrentValueSubject<String, Never> = .init("0")
}

struct Test13_2: View {
    
    @StateObject var viewModel = Test13_2ViewModel()
    
    var body: some View {
        ZStack {
            Color.random
                .ignoresSafeArea()
            
            VStack(spacing: 50.0) {
                VStack(spacing: 10.0) {
                    Text(viewModel.title)
                        .font(.system(size: 80.0))
                    
                    Test13_3(subject: viewModel.subject)
                }
                
                VStack() {
                    TestButton {
                        viewModel.subject.send(random())
                    }
                }
            }
        }
    }
}

func random() -> String {
    String(Int.random(in: 0...100))
}

struct Test13_3: View {
    
    let subject: CurrentValueSubject<String, Never>
    
    @State private var subtitle: String = "0"
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10.0)
            .fill(Color.random)
            .frame(width: 300.0, height: 200.0)
            .overlay {
                Text(subtitle)
                    .font(.system(size: 30.0))
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10.0)
                            .fill(.white)
                    )
                    .onReceive(subject) { subtitle in
                        self.subtitle = subtitle
                    }
            }
    }
}


#Preview {
    Test13_2()
}
