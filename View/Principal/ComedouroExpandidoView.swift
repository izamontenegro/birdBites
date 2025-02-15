//
//  ComedouroExpandidoView.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 08/02/25.
//

import SwiftUI
import SwiftData

struct ComedouroExpandidoView: View {
    
    @State var nomeComedouro: String = "padrao"
    @StateObject private var mqttManager = MQTTManager()
    var body: some View {
        VStack {
            if let data = mqttManager.receivedData {
                Text("Luminosidade: \(String(format: "%.2f", data.luminosidade))")
                    .foregroundStyle(.verdeDetalhes)
            } else {
                Text("infos do comedouro here")
            }
        }
        .onAppear {
            mqttManager.configureMQTT()
        }
        .onDisappear {
            mqttManager.disconnect()
        }
        .navigationTitle(nomeComedouro)
        .navigationBarItems(trailing: Button("Editar") {
            print("edit")
        })
    }
}

#Preview {
    ComedouroExpandidoView()
}

