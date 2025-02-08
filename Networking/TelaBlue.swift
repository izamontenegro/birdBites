//
//  TelaBlue.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 29/01/25.
//

import SwiftUI

struct TelaBlue: View {
    @State private var wifiSSID: String = ""
    @State private var wifiPassword: String = ""
    @StateObject private var bleManager = BLEManager()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Configurar Wi-Fi")
                .font(.largeTitle)
                .bold()
            
            TextField("Nome do Wi-Fi (SSID)", text: $wifiSSID)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Senha do Wi-Fi", text: $wifiPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                bleManager.startScanning()
            }) {
                Text("Buscar Dispositivos")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            List(bleManager.discoveredPeripherals, id: \.peripheral.identifier) { device in
                Button(action: {
                    bleManager.connectToPeripheral(device.peripheral)
                }) {
                    HStack {
                        Text(device.name)
                            .font(.headline)
                        Spacer()
                        if bleManager.connectedPeripheral?.identifier == device.peripheral.identifier {
                            Text("Conectado ✅")
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
            
            Button(action: {
                bleManager.sendDataToPeripheral(wifiName: wifiSSID, password: wifiPassword)
            }) {
                Text("Enviar para ESP32")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .disabled(bleManager.connectedPeripheral == nil || wifiSSID.isEmpty || wifiPassword.isEmpty)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    TelaBlue()
}
