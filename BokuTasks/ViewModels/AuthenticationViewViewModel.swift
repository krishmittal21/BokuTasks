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
import AuthenticationServices
import CryptoKit

@MainActor
class AuthenticationViewViewModel: ObservableObject {
    
    @Published var errorMessage: String?
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    let currentDate = Date().timeIntervalSince1970
    private var currentNonce: String?
    
    enum AuthenticationError: Error {
      case tokenError(message: String)
    }
    
    func insertUserRecord(id: String, name: String, email: String, joined: TimeInterval) {
        let newUser = User(id: id, name: name, email: email, joined: joined)
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }

}


extension AuthenticationViewViewModel {
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
            
            insertUserRecord(id: firebaseUser.uid, name: firebaseUser.displayName ?? "", email: firebaseUser.email ?? "", joined: currentDate)
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

