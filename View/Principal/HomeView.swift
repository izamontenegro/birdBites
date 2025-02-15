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
    @State var notificacoes: Bool = false
    
    var body : some View {
        NavigationStack {
            VStack(alignment: .leading) {
                    Text("Seus comedouros, \(user?.userName ?? "default")")
                        .font(.title)
                        .fontDesign(.rounded)
                        .foregroundStyle(.verdeDetalhes)
                        .fontWeight(.bold)
                        .padding()
                    
                    ComedourosListView()
                    .padding()
                    
                    ButtonAdicionarComedouro()
                    .padding()
                    
                    NavigationLink(
                        destination: NotificacoesView(),
                        isActive: $notificacoes) {
                            EmptyView()
                        }
                
            }
            .navigationBarItems(leading: Button("BirdBites") {
                print("Botão BirdBites pressionado")
            }, trailing: Button("Notificações") {
                notificacoes = true
            })
        }
    }
}

#Preview {
    HomeView()
}
