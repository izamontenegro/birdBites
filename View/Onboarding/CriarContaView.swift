//
//  CriarContaView.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 15/02/25.
//

import SwiftUI
import SwiftData

struct CriarContaView: View {
    @Environment(\.modelContext) private var context
    @State var usuario: User
    @State private var isLoggedIn = false
    @State private var senha: String = " "
    @State private var senhaConfirmacao: String = " "
    

    @MainActor func addUser() {
        context.insert(usuario)
        isLoggedIn = true
    }

    var body: some View {
        VStack {
            Text("Criar conta")
                .font(.largeTitle)
                .padding()

            NavigationLink(
                destination: ContentView(),
                isActive: $isLoggedIn) {
                    EmptyView()
            }

            Button {
                addUser()
            } label: {
                Text("criar conta")
                    .padding(.horizontal, UIScreen.main.bounds.width / 5)
                    .padding(.vertical, 10)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .disabled(usuario.userName.count < 3)

            TextField("Name", text: $usuario.userName)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(13)
                .padding(.bottom, 20)
            TextField("Senha", text: $senha)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(13)
                .padding(.bottom, 20)
            TextField("Confirmar senha", text: $senhaConfirmacao)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(13)
                .padding(.bottom, 20)
        }
    }
}

struct CriarContaView_Preview: PreviewProvider {
    static var previews: some View {
        CriarContaView(usuario: User())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
