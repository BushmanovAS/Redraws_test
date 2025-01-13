//
//  Test12.swift
//  SwiftUI Redraw
//
//  Created by anbushmanov on 29.12.2024.
//

import SwiftUI

// Показывает как работает equatable, зачем он нужен, как работает без него. Стоит обратить особенное внимение, что если мы убираем static func == (lhs: Test12_1, rhs: Test12_1) или .equatable, то работать не будет.

extension Int {
    var isEven: Bool { return self % 2 == 0 }
}

struct Test12: View {
    
    @State private var number: Int = 1
    
    var body: some View {
        VStack {
            Test12_1(number: number)
                .equatable()
            
            TestButton {
                number = Int.random(in: 1...100)
            }
        }
    }
}

struct Test12_1: View, Equatable {
    
    let number: Int
    
    var body: some View {
        let _ = print("\(number.isEven ? "✅" : "🛑")")
        
        if number.isEven {
            EvenView()
        } else {
            OddView()
        }
    }
    
    static func == (lhs: Test12_1, rhs: Test12_1) -> Bool {
        return lhs.number.isEven == rhs.number.isEven
    }
}

struct EvenView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10.0)
            .fill(.green)
            .frame(width: 200.0, height: 200.0)
            .overlay {
                Text("Чёт")
                    .font(.system(size: 40.0))
            }
    }
}

struct OddView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10.0)
            .fill(.yellow)
            .frame(width: 200.0, height: 200.0)
            .overlay {
                Text("Нечет")
                    .font(.system(size: 40.0))
            }
    }
}

#Preview {
    Test12()
}
