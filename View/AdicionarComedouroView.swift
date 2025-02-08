//
//  AdicionarComedouroView.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 08/02/25.
//

import SwiftUI
import SwiftData

struct AdicionarComedouroView: View {
    var body: some View {
        Text("adicionando comedouro")
        
        NavigationLink(destination: ContentView()) {
            Text("criar comedouro")
        }
    }
}

#Preview {
    AdicionarComedouroView()
}
