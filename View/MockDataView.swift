//
//  MockDataView.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 14/01/25.
//

import SwiftUI

// aqui nessa view tem os exemplos de como pegar os dados, quando precisar exibir um eh so vir aqui e copiar

struct MockDataView: View {
    @StateObject private var mqttManager = MQTTManager()

    var body: some View {
        ZStack {
            Color.backgroundBege
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("BirdBites")
                    .foregroundStyle(.verdeDetalhes)
                    .fontWeight(.semibold)
                    .font(.largeTitle)
                    .padding()
                
                Spacer()
                
                if let data = mqttManager.receivedData {
                    VStack(alignment: .leading, spacing: 30) {
                        Text("Luminosidade: \(String(format: "%.2f", data.luminosidade))")
                        Text("Quantidade de Comida: \(data.quantidadeComida)%")
                        Text("Umidade Externa: \(String(format: "%.2f", data.umidadeExterno)) %")
                        Text("Umidade Interna: \(String(format: "%.2f", data.umidadeInterno)) %")
                        Text("Temperatura Interna: \(String(format: "%.2f", data.temperaturaInterno)) °C")
                        Text("Temperatura Externa: \(String(format: "%.2f", data.temperaturaExterno)) °C")
                    }
                    .foregroundColor(.verdeDetalhes)
                    .padding()
                    Spacer()
                } else {
                    Text("Aguardando dados...")
                        .foregroundColor(.gray)
                        .padding()
                }
            }
            .onAppear {
                mqttManager.configureMQTT()
            }
            .onDisappear {
                mqttManager.disconnect()
            }
        }
    }
}

#Preview {
    MockDataView()
}
