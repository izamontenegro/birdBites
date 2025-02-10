//
//  CardComedouro.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 20/01/25.
//

// aqui precisa pegar os dados do comedouro e substituir as coisas mockadas, por exemplo...

import SwiftUI

struct CardComedouro: View {
    // aqui as variaveis de controle das coisas, mudar a capa eas barras conforme os dados do comedouro
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("comedouroCapaDia")
                .resizable()
                .scaledToFit()
            
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
            .padding()
        }
        .padding(.trailing)
    }
}

#Preview {
    CardComedouro()
}
