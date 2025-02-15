//
//  CardComedouro.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 20/01/25.
//

// aqui precisa pegar os dados do comedouro e substituir as coisas mockadas, por exemplo...

import SwiftUI

struct CardComedouro: View {
    @State var comedouroNome: String = "Padrao"
    @StateObject private var mqttManager = MQTTManager()
    var body: some View {
        ZStack(alignment: .bottom) {
            // a capa precisa ser definida pela luminosidade ai eh so torcar o switch case
            let capa = {
                switch comedouroNome {
                case "iza":
                    "comedouroCapaDia"
                case "dora":
                    "comedouroCapaChuva"
                default:
                    "comedouroCapaNoite"
                }
            }
            Image(capa())
                .resizable()
                .scaledToFit()
            
            // aqui eh so um exemplo de como puxar os dados pra exibir, data.luminosidade
            VStack(alignment: .leading) {
                if let data = mqttManager.receivedData {
                    Text("Luminosidade: \(String(format: "%.2f", data.luminosidade))")
                        .foregroundStyle(.verdeDetalhes)
                } else {
                    Text("infos do comedouro here")
                }
                
                Text(comedouroNome)
                    .fontDesign(.rounded)
                    .fontWeight(.medium)
                    .font(.headline)
                
                VStack {
                    BarraProgresso(tipo: 1) // Umidade
                    BarraProgresso(progresso: 0.8, tipo: 2) // Comida
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .padding()
        }
        .onAppear {
            mqttManager.configureMQTT()
        }
        .onDisappear {
            mqttManager.disconnect()
        }
        .padding(.trailing)
    }
}

#Preview {
    CardComedouro()
}
