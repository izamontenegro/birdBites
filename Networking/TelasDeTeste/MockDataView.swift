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
                            .foregroundStyle(.verdeDetalhes)
                        Text("Quantidade de Comida: \(data.quantidadeComida)%")
                            .foregroundStyle(.verdeDetalhes)
                        Text("Umidade Externa: \(String(format: "%.2f", data.umidadeExterno)) %")
                            .foregroundStyle(.verdeDetalhes)
                        Text("Umidade Interna: \(String(format: "%.2f", data.umidadeInterno)) %")
                            .foregroundStyle(.verdeDetalhes)
                        Text("Temperatura Interna: \(String(format: "%.2f", data.temperaturaInterno)) °C")
                            .foregroundStyle(.verdeDetalhes)
                        Text("Temperatura Externa: \(String(format: "%.2f", data.temperaturaExterno)) °C")
                            .foregroundStyle(.verdeDetalhes)
                    }
                    
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
//
//import SwiftUI
//import CocoaMQTT
//
//// Gerenciador MQTT que atualiza os dados recebidos via MQTT
//class MQTTManager: NSObject, ObservableObject, CocoaMQTTDelegate {
//    // Propriedades publicadas para atualizar a UI
//    @Published var luminosity: String = "--"
//    @Published var internalTemp: String = "--"
//    @Published var externalTemp: String = "--"
//    @Published var internalHumidity: String = "--"
//    @Published var externalHumidity: String = "--"
//    @Published var foodQuantity: String = "--"
//    
//    private var mqtt: CocoaMQTT?
//    
//    override init() {
//        super.init()
//        setupMQTT()
//    }
//    
//    // Configura o cliente MQTT
//    func setupMQTT() {
//        let clientID = "iOSClient-\(UUID().uuidString)"
//        mqtt = CocoaMQTT(clientID: clientID, host: "test.mosquitto.org", port: 1883)
//        mqtt?.keepAlive = 60
//        mqtt?.delegate = self
//        mqtt?.connect()
//    }
//    
//    // MARK: - CocoaMQTTDelegate
//    
//    // Conexão estabelecida
//    func mqtt(_ mqtt: CocoaMQTT, didConnectAck ack: CocoaMQTTConnAck) {
//        if ack == .accept {
//            print("Conectado ao MQTT com sucesso!")
//            mqtt.subscribe("STATUS_COMEDOURO")
//            mqtt.subscribe("status_comedouro")
//        } else {
//            print("Falha na conexão MQTT: \(ack)")
//        }
//    }
//    
//    // Recebe mensagens do broker
//    func mqtt(_ mqtt: CocoaMQTT, didReceiveMessage message: CocoaMQTTMessage, id: UInt16) {
//        guard let jsonString = message.string else { return }
//        print("Mensagem recebida: \(jsonString)")
//        
//        if let data = jsonString.data(using: .utf8) {
//            do {
//                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//                    DispatchQueue.main.async {
//                        self.luminosity = "\(json["luminosidade"] ?? "--")"
//                        self.internalTemp = "\(json["temperaturaInterna"] ?? "--")"
//                        self.externalTemp = "\(json["temperaturaExterna"] ?? "--")"
//                        self.internalHumidity = "\(json["umidadeInterna"] ?? "--")"
//                        self.externalHumidity = "\(json["umidadeExterna"] ?? "--")"
//                        self.foodQuantity = "\(json["quantidadeComida"] ?? "--")"
//                    }
//                }
//            } catch {
//                print("Erro ao fazer parse do JSON: \(error)")
//            }
//        }
//    }
//    
//    func mqttDidDisconnect(_ mqtt: CocoaMQTT, withError err: Error?) {
//        print("Desconectado do MQTT: \(err?.localizedDescription ?? "Sem erro")")
//    }
//    
//    // Métodos opcionais do delegate
//    func mqtt(_ mqtt: CocoaMQTT, didSubscribeTopics success: NSDictionary, failed: [String]) {
//        print("Inscrito nos tópicos: \(success.allKeys)")
//    }
//    
//    func mqtt(_ mqtt: CocoaMQTT, didUnsubscribeTopics topics: [String]) {
//        print("Cancelou inscrição dos tópicos: \(topics)")
//    }
//    
//    func mqtt(_ mqtt: CocoaMQTT, didPublishMessage message: CocoaMQTTMessage, id: UInt16) {
//        // Opcional: tratar quando uma mensagem é publicada
//    }
//    
//    func mqtt(_ mqtt: CocoaMQTT, didPublishAck id: UInt16) {
//        // Opcional: tratar confirmação de publicação
//    }
//    
//    func mqttDidPing(_ mqtt: CocoaMQTT) {
//        // Opcional
//    }
//    
//    func mqttDidReceivePong(_ mqtt: CocoaMQTT) {
//        // Opcional
//    }
//}
//
//// View SwiftUI que exibe os dados recebidos
//struct MockDataView: View {
//    @StateObject var mqttManager = MQTTManager()
//    
//    var body: some View {
//        NavigationView {
//            VStack(spacing: 20) {
//                Text("Luminosidade: \(mqttManager.luminosity)")
//                    .font(.title2)
//                Text("Temperatura Interna: \(mqttManager.internalTemp)")
//                    .font(.title2)
//                Text("Temperatura Externa: \(mqttManager.externalTemp)")
//                    .font(.title2)
//                Text("Umidade Interna: \(mqttManager.internalHumidity)")
//                    .font(.title2)
//                Text("Umidade Externa: \(mqttManager.externalHumidity)")
//                    .font(.title2)
//                Text("Quantidade de Comida: \(mqttManager.foodQuantity)")
//                    .font(.title2)
//            }
//            .padding()
//            .navigationTitle("Dados do Comedouro")
//        }
//    }
//}
//
//// Preview para o canvas do Xcode
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
