//
//  RegisterViewModel.swift
//  EgoLyfter
//
//  Created by Joel on 6/30/23.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation


class RegisterViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var verifyPassword = ""
//    @Published var errMsg = ""
    @Published var errMsg = ""
    
    //TODO add verify password func
    
    init() {}
    
    func register(){
        errMsg = ""
        
        guard validate() else{
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password){ [weak self] result, error in
            guard let userID = result?.user.uid else{
                return
            }
            
            self?.insertUserRecord(id: userID)
        }
        
    }
    
    private func insertUserRecord(id: String){
        
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users").document(id).setData(newUser.asDictionary())
        
    }
    
    private func validate() -> Bool{
        
        errMsg = ""
        
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
                !email.trimmingCharacters(in: .whitespaces).isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errMsg = "Fill Out All Fields."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errMsg = "Please Enter a Valid Email."
            return false
        }
        
        guard password.count >= 6 else {
            errMsg = "Passwords Must Contain at least 6 characters"
            return false
        }
        guard password != verifyPassword else {
            errMsg = "Passwords must match"
            return false
        }
        
        return true
        
    }
    
    
    
}
