//
//  instrucao1.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 15/02/25.
//

import SwiftUI

struct instrucao1: View {
    var body: some View {
        VStack {
            Text("instrucao de adicionar 1")
            NavigationLink(destination: instrucao2()) {
                Text("proxima")
            }
        }
    }
}
