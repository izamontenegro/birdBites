//
//  TelaInicialView.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 08/02/25.
//

import SwiftUI
import SwiftData

struct TelaInicialView: View {
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
                            Text("login")
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
    TelaInicialView()
}

