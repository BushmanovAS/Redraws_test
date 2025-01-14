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
//    var subject: CurrentValueSubject<String, Never> = .init("0")
}

struct Test13_2: View {
    
    @StateObject var viewModel = Test13_2ViewModel()
    
    @State var subtitle: String = ""
    
    var body: some View {
        let _ = Self._printChanges()
        
        ZStack {
            Color.random
                .ignoresSafeArea()
            
            VStack(spacing: 50.0) {
                VStack(spacing: 10.0) {
                    Text(viewModel.title)
                        .font(.system(size: 80.0))
                    
                    Test13_3(subtitle: $subtitle)
                }
                
                VStack() {
                    TestButton {
                        viewModel.title += "+"
                    }
                    
                    TestButton {
                        subtitle = randomString()
//                        viewModel.subject.send(randomString())
                    }
                }
            }
        }
    }
    
    func randomString() -> String {
        String(Int.random(in: 0...100))
    }
}

struct Test13_3: View {
    
//    var subject: CurrentValueSubject<String, Never>
    @Binding var subtitle: String
    
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
//                    .onReceive(subject) { subtitle in
//                        self.subtitle = subtitle
//                    }
            }
    }
}

#Preview {
    Test13_2()
}
