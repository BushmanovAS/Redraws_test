//
//  Test16.swift
//  SwiftUI Redraw
//
//  Created by anbushmanov on 02.01.2025.
//

import SwiftUI


// В целом, в обычных условиях, анимации будут работать нормально не смотря на перерисовки. То есть если бы эти 5 точек просто вращались, по кругу, никакой проблемы бы не было. Однако, если вы условно решили сделать лоадер, который будет все время вращаться на разный угол, то тут перерирсовки будут ломать анимации. Этот пример гиперутрированный, но анимации сложно сломать специально. Обычно это каждый раз строго индивидуальный кейс. Лекарство мы с вами уже знаем, выносим анимацию в отдельную вью, и все начинает работать как задумано.

struct Test16: View {
    
    @State private var counter = 0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("\(counter)")
                .onReceive(timer) { _ in
                    counter += 1
                }
            
            CirclesView()
        }
    }
}

struct CirclesView: View {
    
    @State private var isAnimated = false
    
    var body: some View {
        ZStack {
            ForEach(0..<5) { index in
                Circle()
                    .frame(width: 40.0, height: 200.0, alignment: .top)
                    .rotationEffect(.degrees(72.0 * Double(index)))
            }
        }
        .rotationEffect(Angle.degrees(
            isAnimated ? Double.random(in: 0.0...360.0) : Double.random(in: 0.0...360.0)))
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 2.0).delay(0.3).repeatForever(autoreverses: true)) {
                isAnimated = true
            }
        }
    }
}

#Preview {
    Test16()
}
