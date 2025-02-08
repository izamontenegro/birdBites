//
//  ContentView.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 14/01/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var mqttManager = MQTTManager()
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem{
                    // aqui colocar o icone e tals
                    Text("inicio")
                }
            CameraView()
                .tabItem{
                    Text("camera")
                }
            ColecaoView()
                .tabItem{
                    Text("colecao")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}
