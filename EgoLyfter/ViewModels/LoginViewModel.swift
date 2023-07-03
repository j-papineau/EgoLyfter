//
//  LoginViewModel.swift
//  EgoLyfter
//
//  Created by Joel on 6/30/23.
//
import FirebaseAuth
import Foundation


class LoginViewModel: ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    @Published var errMsg = ""
    
    init(){}
    
    func login(){
        //reset err message
        guard validate() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
        
        
        print("Called")
    }
    
    private func validate() -> Bool{
        errMsg = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            
            errMsg = "Fill in username or password."
            return false
        }
        
        guard email.contains("@") && email.contains(".")else{
            errMsg = "Email not valid"
            return false
        }
        
        return true
        
    }
}
