//
//  LoginView.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 08/02/25.
//
import SwiftUI
import SwiftData

struct LoginView: View {
    @Environment(\.modelContext) private var context
    @State var usuario: User
    @State private var isLoggedIn = false 

    @MainActor func addUser() {
        context.insert(usuario)
        isLoggedIn = true
    }

    var body: some View {
        VStack {
            Text("loguinho")
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
                Text("login")
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
        }
    }
}

struct LoginView_Preview: PreviewProvider {
    static var previews: some View {
        LoginView(usuario: User())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
