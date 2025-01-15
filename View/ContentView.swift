//
//  ContentView.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 14/01/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var mqttManager = MQTTManager()
    
    var body: some View {
        VStack {
            Text("hello")
        }
    }
}

#Preview {
    ContentView()
}
