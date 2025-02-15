//
//  ComedouroExpandidoView.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 08/02/25.
//

import SwiftUI
import SwiftData

struct ComedouroExpandidoView: View {
    
    @State var comedouro: ComedouroInfo
    @State var goToEdit: Bool = false
    @StateObject var mqttManager = MQTTManager()
    var body: some View {
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
        VStack {
            Image(capa)
                .resizable()
                .scaledToFit()
                .frame(width: 354, height: 210)
            
            VStack {
                HStack {
                    CardTemperatura()
                    CardComida()
                }
                HStack {
                    CardUmidade()
                    CardLuminosidade()
                }
            }
            
            NavigationLink(destination: EditarComedouroView(comedouro: comedouro), isActive: $goToEdit) {
                EmptyView()
            }
        }
        .onAppear {
            mqttManager.configureMQTT()
        }
        .onDisappear {
            mqttManager.disconnect()
        }
        .navigationTitle(comedouro.comedouroName)
        .navigationBarItems(trailing: Button("Editar") {
          goToEdit = true
        })
    }
}

