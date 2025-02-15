//
//  ButtonAdicionarComedouro.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 15/02/25.
//

import SwiftUI

struct ButtonAdicionarComedouro: View {
    var body: some View {
        VStack {
            NavigationLink(destination: instrucao1()) {
                Text("adicionar comedouro")
                    .foregroundStyle(.white)
                    .padding()
                    .background(
                        Color.verdeDetalhes
                    )
            }
        }

    }
}
