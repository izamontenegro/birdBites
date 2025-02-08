//
//  CardComedouro.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 20/01/25.
//

// aqui precisa pegar os dados do comedouro e substituir as coisas mockadas, por exemplo...

import SwiftUI

struct CardComedouro: View {
    var body: some View {
        VStack {
            Image(systemName: "bird.fill") //imagem do comedouro
                .resizable()
                .scaledToFit()
                .foregroundStyle(Color.verdeDetalhes)
                .frame(height: 220)
            
            VStack(alignment: .leading) {
                Text("Sítio Sossego")  // nome comedouro
                    .fontDesign(.rounded)
                    .fontWeight(.medium)
                    .font(.headline)
                
                VStack {
                    // aqui nas barras tambem teria q passar os dados específicos do comedouro
                    BarraProgresso(tipo: 1) // Umidade
                    BarraProgresso(progresso: 0.8, tipo: 2) // Comida
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
        }
        .padding()
        .background(Color.yellow.opacity(0.3))
        .cornerRadius(20)
//        .padding() tirando aq pra nao bugar na home mas provavelmente ainda vai unheunhe
    }
}

#Preview {
    CardComedouro()
}
