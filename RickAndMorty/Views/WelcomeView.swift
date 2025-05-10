//
//  WelcomeView.swift
//  RickAndMorty
//
//  Created by Sebastian Niestój on 10/05/2025.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to the club, pal")
                .font(.custom("Get Schwifty", size: 40))
                .foregroundStyle(.green)
                .padding()
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Image("rickandmorty")
                .resizable()
            
            Spacer()
            
            Text("Press the button below\nto see them all")
                .font(.custom("Get Schwifty", size: 30))
                .foregroundStyle(.green)
                .padding()
                .multilineTextAlignment(.center)
            
            Image(systemName: "arrow.down")
                .resizable()
                .frame(width: 80, height: 120)
                .tint(.white)
                .padding()
        }
    }
}

#Preview {
    WelcomeView()
}
