//
//  ComedourosListView.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 15/02/25.
//

import SwiftUI
import SwiftData

struct ComedourosListView: View {
    @Query var comedouros: [ComedouroInfo]
    var body: some View {
        VStack(alignment: .leading){
            Text("Seus comedouros")
            if comedouros.isEmpty {
                Image("emptyStateComedouros")
                
            }
            else {
               
                    ScrollView(.horizontal) {
                        HStack {
                        ForEach(comedouros) { comedouro in
                            NavigationLink(destination: ComedouroExpandidoView(nomeComedouro: comedouro.comedouroName)){
                                CardComedouro(comedouroNome: comedouro.comedouroName)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ComedourosListView()
}
