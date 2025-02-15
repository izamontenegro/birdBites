//
//  BoasVindasView.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 15/02/25.
//

import SwiftUI
import SwiftData

struct BoasVindasView: View {
    @Query var users: [User]
    var user: User? { users.first }
    
    var body: some View {
        NavigationStack {
            VStack {
                if !users.isEmpty {
                    ContentView()
                } else {
                    
                    VStack {
                        NavigationLink(destination: LoginView(usuario: User())) {
                            Text("Login")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        
                        NavigationLink(destination: LoginView(usuario: User())) {
                            Text("Criar conta")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        
                        .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    BoasVindasView()
}

