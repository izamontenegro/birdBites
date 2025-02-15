//
//  CardLuminosidade.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 15/02/25.
//

import SwiftUI
import SwiftData

struct CardLuminosidade: View {
    @StateObject private var mqttManager = MQTTManager()
    var body: some View {
        let data = mqttManager.receivedData
        VStack {
            Text("Luminosidade: \(data?.luminosidade ?? 0.0)")
        }
        .padding()
        .background(
            Color.amareloLuminosidade
        )
    }
}
