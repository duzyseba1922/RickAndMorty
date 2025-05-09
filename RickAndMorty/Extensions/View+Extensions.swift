//
//  View+Extensions.swift
//  RickAndMorty
//
//  Created by Sebastian Niestój on 09/05/2025.
//

import SwiftUI

extension View {
    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: self.hidden()
        case false: self
        }
    }
}
