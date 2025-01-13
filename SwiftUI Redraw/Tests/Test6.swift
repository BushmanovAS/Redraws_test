//
//  Test6.swift
//  SwiftUI Redraw
//
//  Created by anbushmanov on 29.12.2024.
//

import SwiftUI

// ОДНОВРЕМЕННОЕ изменение нескольких параметров, на которые завязана перерисовка, приведет только к одной перерисовке за раз. SwiftUI не будет перерисовывать экран ради каждого изменения. Но показывает он все.

struct Test6: View {
    
    @State private var counter1: CGFloat = 0.0
    @State private var counter2: CGFloat = 0.0
    @State private var counter3: CGFloat = 0.0
    
    var body: some View {
        let _ = Self._printChanges()
        
        ZStack {
            Color.random
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(.white)
                        .frame(width: 50.0, height: 50.0)
                        .offset(x: -counter1)
                    
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(.white)
                        .frame(width: 50.0, height: 50.0 + counter2)
                    
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(.white)
                        .frame(width: 50.0, height: 50.0)
                        .overlay {
                            Text("\(Int(counter3 / 5))")
                        }
                }
                
                TestButton {
                    counter1 += 5.0
                    counter2 += 5.0
                    counter3 += 5.0
                }
            }
        }
    }
}

#Preview {
    Test6()
}
