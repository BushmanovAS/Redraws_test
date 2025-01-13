//
//  View+Extension.swift
//  SwiftUI Redraw
//
//  Created by anbushmanov on 01.01.2025.
//

import SwiftUI

extension View {
    func showGraph() -> Self {
        let mirror = Mirror(reflecting: self).description
        print(mirror)
        
        return self
    }
}
