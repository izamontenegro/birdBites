//
//  TabBar.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 20/01/25.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Text("Início")
                    Image(systemName: "house")
                }
            HomeView()
                .tabItem {
                    Text("Galeria")
                    Image(systemName: "photo")
                }
            
            HomeView()
                .tabItem {
                    Text("Perfil")
                    Image(systemName: "person")
                }
        }
        
    }
}

#Preview {
    TabBar()
}
