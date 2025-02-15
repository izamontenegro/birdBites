//
//  CardComedouro.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 20/01/25.
//

import SwiftUI

struct CardComedouro: View {
    @State var comedouroNome: String = "Padrão"
    @StateObject private var mqttManager = MQTTManager()

    var body: some View {
        ZStack(alignment: .bottom) {
            let data = mqttManager.receivedData
            let luminosidade = data?.luminosidade ?? 0.0
            let capa: String = {
                switch luminosidade {
                case 0..<1000:
                    return "comedouroCapaNoite"
                case 1000..<30000:
                    return "comedouroCapaChuva"
                default:
                    return "comedouroCapaDia"
                }
            }()
            
            // tem que ajeitar esses valores aqui
            let umidade = (data?.umidadeInterno ?? 0.0)/100
            let comida = (data?.quantidadeComida ?? 0.0)/100

            Image(capa)
                .resizable()
                .scaledToFit()

            VStack(alignment: .leading) {
                Text("\(luminosidade)")
                Text(comedouroNome)
                    .fontDesign(.rounded)
                    .fontWeight(.medium)
                    .font(.headline)

                VStack {
                    BarraProgresso(dados: umidade, tipo: 1)
                    BarraProgresso(dados: comida, tipo: 2)
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
