//
//  AuthenticationViewViewModel.swift
//  BokuTasks
//
//  Created by Krish Mittal on 27/02/24.
//

import Foundation
import Firebase
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift

@MainActor
class AuthenticationViewViewModel: ObservableObject {
    @Published var errorMessage: String?
    
    enum AuthenticationError: Error {
      case tokenError(message: String)
    }
    
    func signInWithGoogle() async -> Bool {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            fatalError("No client ID found in Firebase Config")
        }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first,
              let rootViewController = window.rootViewController else {
            print("There is no root view controller")
            return false
        }
        
        do {
            let userAuthentication = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
            let user = userAuthentication.user
            guard let idToken = user.idToken else {
                throw AuthenticationError.tokenError(message: "ID token missing")
            }
            let accessToken = user.accessToken
            let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)
            let result = try await Auth.auth().signIn(with: credential)
            let firebaseUser = result.user
            print("User \(firebaseUser.uid) signed in with email \(firebaseUser.email ?? "unknown")")
            
            return true
            
        }
        catch {
            print(error.localizedDescription)
            errorMessage = error.localizedDescription
            return false
        }
    }
}
