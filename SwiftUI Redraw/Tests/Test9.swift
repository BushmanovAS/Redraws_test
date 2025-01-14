//
//  Test9.swift
//  SwiftUI Redraw
//
//  Created by anbushmanov on 29.12.2024.
//

import SwiftUI

// Вынос в обычную вычисляемую проперти ничего в целом не меняет, только повышает читабельность кода.

// Если заглянуть под капот, то body продолжает разрастаться, вынесли мы только с виду, по факту мы сделали тоже самое, что если бы оно осталось внутри body

// Так же можно докинуть, что не нужно писать @ViewBuilder около каждой проперти, это ничего не дает)

struct Test9: View {

    @State private var counter: Int = 0

    var body: some View {
        ZStack {
            Color.random

            content
        }
        .showGraph()
        .ignoresSafeArea()
    }
    
    var content: some View {
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
                
                TestButton {
                    counter += 1
                }
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 10.0))
        .frame(width: 300.0, height: 300.0)
    }
}

#Preview {
    Test9()
}


//struct Test9: View {
//
//    @State private var counter: CGFloat = 0.0
//
//    var body: some View {
//        ZStack {
//            Color.random
//
//            VStack {
//                Text("Counter: \(Int(counter))")
//
//                Test7_1(counter: $counter)
//
//            }
//        }
//        .ignoresSafeArea()
//    }
//}
//
//struct Test9_1: View {
//
//    @Binding var counter: CGFloat
//
//    var body: some View {
//        VStack {
//            Text("Counter: \(Int(counter))")
//
//            TestButton {
//                counter += 1
//            }
//        }
//    }
//}
//
//#Preview {
//    Test9()
//}
