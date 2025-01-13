//
//  Test18.swift
//  SwiftUI Redraw
//
//  Created by anbushmanov on 03.01.2025.
//

import SwiftUI

// Опасность if/else в коде. Допустим вы решили, что по достижении определенного оффсета, вы хотите удалить модификатор, который отслеживает оффсет. Происходи вот что. Перерисовка и создание нового ScrollView. Вы можете подумать, что так никто не делает, однако тут вступает в дело модификатор .if И вот с ним это выглядит даже как будто бы красиво. Но, по факту это тоже самое, только в красивой обертке. 

struct Test18: View {
    
    @State private var showBar = true
    
    var body: some View {
        ScrollView {
            VStack {
                Rectangle()
                    .scrollOffset { offset in
                        if offset < -600.0 {
                            showBar = false
                        }
                    }
                
                TestList()
            }
        }
        .if(showBar) { view in
            view
                .navigationTitle("Conditional test")
        }
    }
}

#Preview {
    Test18()
}

extension View {
    @ViewBuilder
    func `if`<Content: View>(
        _ condition: Bool,
        transform: (Self) -> Content
    ) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
