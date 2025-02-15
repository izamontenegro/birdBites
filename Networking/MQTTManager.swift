//
//  MQTTManager.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 14/01/25.
//

//import Foundation
//import CocoaMQTT
//
//class MQTTManager: ObservableObject {
//    @Published var receivedData: ComedouroData?
//
//    private var mqttClient: CocoaMQTT?
//
//    init() {
//        configureMQTT()
//    }
//
//    public func configureMQTT() {
//        let clientID = "iOSClient-\(UUID().uuidString)"
//        mqttClient = CocoaMQTT(clientID: clientID, host: "test.mosquitto.org", port: 1883)
//        mqttClient?.username = nil
//        mqttClient?.password = nil
//        mqttClient?.keepAlive = 60
//        mqttClient?.delegate = self
//    }
//
//    func publish(message: String, topic: String) {
//        mqttClient?.publish(topic, withString: message, qos: .qos1)
//    }
//
//    func disconnect() {
//        mqttClient?.disconnect()
//    }
//}
//
//extension MQTTManager: CocoaMQTTDelegate {
//    func mqtt(_ mqtt: CocoaMQTT, didConnectAck ack: CocoaMQTTConnAck) {
//        if ack == .accept {
//            print("Conectado ao broker MQTT com sucesso!")
//            mqtt.subscribe("STATUS_COMEDOURO")
//            
//        } else {
//            print("Falha ao conectar ao broker: \(ack)")
//        }
//    }
//
////    func mqtt(_ mqtt: CocoaMQTT, didReceiveMessage message: CocoaMQTTMessage, id: UInt16) {
////        if let jsonString = message.string {
////            print("Mensagem recebida: \(jsonString)")
////            if let data = try? JSONDecoder().decode(ComedouroData.self, from: Data(jsonString.utf8)) {
////                DispatchQueue.main.async {
////                    self.receivedData = data
////                }
////            } else {
////                print("Erro ao decodificar os dados recebidos.")
////            }
////        }
////    }
//    
//    func mqtt(_ mqtt: CocoaMQTT, didReceiveMessage message: CocoaMQTTMessage, id: UInt16) {
//        let payloadString = message.string ?? "Mensagem vazia"
//        print("📩 Mensagem recebida no tópico \(message.topic): \(payloadString)")
//
//        // Tente decodificar JSON, caso contrário, apenas exiba a mensagem normalmente
//        if let data = payloadString.data(using: .utf8) {
//            do {
//                let json = try JSONSerialization.jsonObject(with: data, options: [])
//                print("📜 JSON recebido: \(json)")
//            } catch {
//                print("⚠️ Mensagem não é um JSON válido, exibindo como texto: \(payloadString)")
//            }
//        }
//    }
//
//
//    func mqtt(_ mqtt: CocoaMQTT, didSubscribeTopics topics: [String]) {
//        print("Inscrito nos tópicos: \(topics)")
//    }
//
//    func mqtt(_ mqtt: CocoaMQTT, didUnsubscribeTopics topics: [String]) {
//        print("Cancelou inscrição nos tópicos: \(topics)")
//    }
//
//    func mqttDidDisconnect(_ mqtt: CocoaMQTT, withError err: Error?) {
//        print("Desconectado do broker MQTT: \(err?.localizedDescription ?? "Sem erro")")
//    }
//
//    func mqtt(_ mqtt: CocoaMQTT, didPublishMessage message: CocoaMQTTMessage, id: UInt16) {
//        print("Mensagem publicada: \(message.string ?? "Sem conteúdo")")
//    }
//
//    func mqtt(_ mqtt: CocoaMQTT, didPublishAck id: UInt16) {
//        print("Publicação confirmada para mensagem com ID \(id)")
//    }
//
//    // Funções obrigatórias do protocolo CocoaMQTTDelegate
//    func mqtt(_ mqtt: CocoaMQTT, didStateChangeTo state: CocoaMQTTConnState) {
//        print("Mudança de estado: \(state)")
//    }
//
//    func mqtt(_ mqtt: CocoaMQTT, didReceive trust: SecTrust, completionHandler: @escaping (Bool) -> Void) {
//        completionHandler(true)
//    }
//
//    func mqttDidPing(_ mqtt: CocoaMQTT) {
//        print("Ping enviado.")
//    }
//
//    func mqttDidReceivePong(_ mqtt: CocoaMQTT) {
//        print("Pong recebido.")
//    }
//
//    func mqtt(_ mqtt: CocoaMQTT, didSubscribeTopics success: NSDictionary, failed: [String]) {
//        if failed.count > 0 {
//            print("Falha ao se inscrever nos tópicos: \(failed)")
//        }
//        if success.count > 0 {
//            print("Inscrito com sucesso nos tópicos: \(success)")
//        }
//    }
//}

//
//import UIKit
//import CocoaMQTT
//
//class ViewController: UIViewController, CocoaMQTTDelegate {
//    
//    var mqtt: CocoaMQTT?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupMQTT()
//    }
//    
//    func setupMQTT() {
//        // Gera um clientID único para o dispositivo
//        let clientID = "iOSClient-\(UUID().uuidString)"
//        
//        // Cria a instância do cliente MQTT
//        mqtt = CocoaMQTT(clientID: clientID, host: "test.mosquitto.org", port: 1883)
//        mqtt?.keepAlive = 60
//        mqtt?.delegate = self
//        
//        // Conecta ao broker MQTT
//        mqtt?.connect()
//    }
//    
//    // MARK: - CocoaMQTTDelegate Methods
//    
//    /// Chamado quando o cliente recebe a confirmação da conexão.
//    func mqtt(_ mqtt: CocoaMQTT, didConnectAck ack: CocoaMQTTConnAck) {
//        if ack == .accept {
//            print("Conectado ao MQTT com sucesso!")
//            // Inscreve-se no tópico de interesse
//            mqtt.subscribe("STATUS_COMEDOURO", qos: .qos1)
//        } else {
//            print("Falha na conexão com MQTT: \(ack)")
//        }
//    }
//    
//    /// Chamado sempre que uma mensagem é recebida.
//    func mqtt(_ mqtt: CocoaMQTT, didReceiveMessage message: CocoaMQTTMessage, id: UInt16) {
//        if let jsonString = message.string {
//            print("Mensagem recebida no tópico \(message.topic): \(jsonString)")
//            
//            // Tenta converter a string JSON para um objeto
//            if let data = jsonString.data(using: .utf8) {
//                do {
//                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//                        // Exibe os dados recebidos
//                        print("Dados JSON parseados: \(json)")
//                        
//                        // Aqui você pode, por exemplo, atualizar a interface do usuário com os dados
//                    }
//                } catch {
//                    print("Erro ao fazer parse do JSON: \(error)")
//                }
//            }
//        }
//    }
//    
//    /// Chamado quando a inscrição em tópicos é bem-sucedida.
//    func mqtt(_ mqtt: CocoaMQTT, didSubscribeTopics success: NSDictionary, failed: [String]) {
//        print("Inscrito nos tópicos: \(success.allKeys)")
//    }
//    
//    /// Chamado quando o cliente se desconecta do broker.
//    func mqttDidDisconnect(_ mqtt: CocoaMQTT, withError err: Error?) {
//        print("Desconectado do MQTT: \(err?.localizedDescription ?? "sem erro")")
//    }
//    
//    // Métodos opcionais (podem ser implementados conforme a necessidade)
//    func mqtt(_ mqtt: CocoaMQTT, didUnsubscribeTopics topics: [String]) {
//        print("Cancelou a inscrição dos tópicos: \(topics)")
//    }
//    
//    func mqtt(_ mqtt: CocoaMQTT, didPublishMessage message: CocoaMQTTMessage, id: UInt16) {
//        // Chamado quando uma mensagem é publicada com sucesso
//    }
//    
//    func mqtt(_ mqtt: CocoaMQTT, didPublishAck id: UInt16) {
//        // Chamado quando a publicação é confirmada pelo broker
//    }
//    
//    func mqttDidPing(_ mqtt: CocoaMQTT) {
//        // Chamado quando um ping é enviado
//    }
//    
//    func mqttDidReceivePong(_ mqtt: CocoaMQTT) {
//        // Chamado quando um pong é recebido
//    }
//}

import Foundation
import CocoaMQTT

class MQTTManager: ObservableObject {
    @Published var receivedData: ComedouroData?

    private var mqttClient: CocoaMQTT?

    init() {
        configureMQTT()
    }

    public func configureMQTT() {
        let clientID = "iOSClient-\(UUID().uuidString)"
        mqttClient = CocoaMQTT(clientID: clientID, host: "test.mosquitto.org", port: 1883)
        mqttClient?.username = nil
        mqttClient?.password = nil
        mqttClient?.keepAlive = 60
        mqttClient?.delegate = self
        mqttClient?.connect()
    }

    func publish(message: String, topic: String) {
        mqttClient?.publish(topic, withString: message, qos: .qos1)
    }

    func disconnect() {
        mqttClient?.disconnect()
    }
}

extension MQTTManager: CocoaMQTTDelegate {
    func mqtt(_ mqtt: CocoaMQTT, didConnectAck ack: CocoaMQTTConnAck) {
        if ack == .accept {
            print("Conectado ao broker MQTT com sucesso!")
            mqtt.subscribe("STATUS_COMEDOURO")
        } else {
            print("Falha ao conectar ao broker: \(ack)")
        }
    }

    func mqtt(_ mqtt: CocoaMQTT, didReceiveMessage message: CocoaMQTTMessage, id: UInt16) {
        if let jsonString = message.string {
            print("Mensagem recebida: \(jsonString)")
            if let data = try? JSONDecoder().decode(ComedouroData.self, from: Data(jsonString.utf8)) {
                DispatchQueue.main.async {
                    self.receivedData = data
                }
            } else {
                print("Erro ao decodificar os dados recebidos.")
            }
        }
    }

    func mqtt(_ mqtt: CocoaMQTT, didSubscribeTopics topics: [String]) {
        print("Inscrito nos tópicos: \(topics)")
    }

    func mqtt(_ mqtt: CocoaMQTT, didUnsubscribeTopics topics: [String]) {
        print("Cancelou inscrição nos tópicos: \(topics)")
    }

    func mqttDidDisconnect(_ mqtt: CocoaMQTT, withError err: Error?) {
        print("Desconectado do broker MQTT: \(err?.localizedDescription ?? "Sem erro")")
    }

    func mqtt(_ mqtt: CocoaMQTT, didPublishMessage message: CocoaMQTTMessage, id: UInt16) {
        print("Mensagem publicada: \(message.string ?? "Sem conteúdo")")
    }

    func mqtt(_ mqtt: CocoaMQTT, didPublishAck id: UInt16) {
        print("Publicação confirmada para mensagem com ID \(id)")
    }

    // Funções obrigatórias do protocolo CocoaMQTTDelegate
    func mqtt(_ mqtt: CocoaMQTT, didStateChangeTo state: CocoaMQTTConnState) {
        print("Mudança de estado: \(state)")
    }

    func mqtt(_ mqtt: CocoaMQTT, didReceive trust: SecTrust, completionHandler: @escaping (Bool) -> Void) {
        completionHandler(true)
    }

    func mqttDidPing(_ mqtt: CocoaMQTT) {
        print("Ping enviado.")
    }

    func mqttDidReceivePong(_ mqtt: CocoaMQTT) {
        print("Pong recebido.")
    }

    // Adicionando o método solicitado para conformidade
    func mqtt(_ mqtt: CocoaMQTT, didSubscribeTopics success: NSDictionary, failed: [String]) {
        if failed.count > 0 {
            print("Falha ao se inscrever nos tópicos: \(failed)")
        }
        if success.count > 0 {
            print("Inscrito com sucesso nos tópicos: \(success)")
        }
    }
}
