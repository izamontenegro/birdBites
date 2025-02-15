//
//  instrucao2.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 15/02/25.
//

import SwiftUI

struct instrucao2: View {
    var body: some View {
        VStack {
            Text("instrucao de adicionar 2")
            
            NavigationLink(destination: AdicionarComedouroView(comedouro: ComedouroInfo())) {
                Text("Próxima")
            }
        }
    }
}
