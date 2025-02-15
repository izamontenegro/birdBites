//
//  ContentView.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 14/01/25.
//

import SwiftUI

// aqui eu to controlando a navegacao pela tab view

struct ContentView: View {
    
    var body: some View {
        
        // view do figma
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
        
//   View de testes
//                TabView {
//                    MockDataView()
//                        .tabItem{
//                            // aqui colocar o icone e tals
//                            Text("dados mockados")
//                        }
//                    CameraView(sourceType: .camera)
//                        .tabItem{
//                            Text("camera")
//                        }
//                    TelaBlue()
//                        .tabItem{
//                            Text("bluetooth")
//                        }
//                }
//                .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}
