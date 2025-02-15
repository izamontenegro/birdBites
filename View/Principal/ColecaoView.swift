//
//  ColecaoView.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 08/02/25.
//

import SwiftUI
import SwiftData

struct ColecaoView: View {
    var body: some View {
        VStack {
            Text("colecao")
            
            HStack {
                NavigationLink(destination: PassaroExpandidoView()){
                    Text("foto passaro")
                        .padding()
                        .background(
                            Color.yellow
                        )
                }
                
                NavigationLink(destination: PassaroExpandidoView()){
                    Text("foto passaro")
                        .padding()
                        .background(
                            Color.yellow
                        )
                }
                
                NavigationLink(destination: PassaroExpandidoView()){
                    Text("foto passaro")
                        .padding()
                        .background(
                            Color.yellow
                        )
                }
                
            }
        }
    }
}

#Preview {
    ColecaoView()
}
