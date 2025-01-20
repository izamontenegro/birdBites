//
//  HomeView.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 20/01/25.
//

import SwiftUI

struct HomeView: View {
    var body : some View {
        VStack (alignment: .leading) {
            Text("Seus comedouros")
                .font(.title)
                .fontDesign(.rounded)
                .foregroundStyle(.verdeDetalhes)
                .fontWeight(.bold)
            
            // fazer aqui um foreach user.comedouros Hsctak com os cards
            CardComedouro()
        }
        .padding(.horizontal)
    }
}

#Preview {
    HomeView()
}
