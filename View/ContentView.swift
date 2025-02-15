//
//  ContentView.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 14/01/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        // view do figma
//        TabView {
//            HomeView()
//                .tabItem{
//                    // aqui colocar o icone e tals
//                    Text("inicio")
//                }
//            CameraView(sourceType: .camera)
//                .tabItem{
//                    Text("camera")
//                }
//            ColecaoView()
//                .tabItem{
//                    Text("colecao")
//                }
//        }
//        .navigationBarBackButtonHidden(true)
        
//
                TabView {
                    MockDataView()
                        .tabItem{
                            // aqui colocar o icone e tals
                            Text("dados mockados")
                        }
                    CameraView(sourceType: .camera)
                        .tabItem{
                            Text("camera")
                        }
                    TelaBlue()
                        .tabItem{
                            Text("bluetooth")
                        }
                }
                .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}
