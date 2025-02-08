//
//  HomeView.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 20/01/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Query var users: [User]
    var user: User? { users.first }
    
    var body : some View {
        NavigationStack {
            VStack {
                    VStack (alignment: .leading) {
                        NavigationLink(destination: NotificacoesView()){
                            Text("notificacao")
                        }
                        Text("Seus comedouros, \(user?.userName ?? "default")")
                            .font(.title)
                            .fontDesign(.rounded)
                            .foregroundStyle(.verdeDetalhes)
                            .fontWeight(.bold)
                        
                        // fazer aqui um foreach user.comedouros Hsctak com os cards
                        NavigationLink(destination: ComedouroExpandidoView()){
                            CardComedouro()
                        }
                        
                        NavigationLink(destination: AdicionarComedouroView()) {
                            Text("adicionar comedouro")
                        }
                    }
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    HomeView()
}
