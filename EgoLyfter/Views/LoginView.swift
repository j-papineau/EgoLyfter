//
//  LoginView.swift
//  EgoLyfter
//
//  Created by Joel on 6/30/23.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    
    var body: some View {
        
       
        ZStack {
            
            
            
            
            NavigationView {
                VStack{
                    //Header
                    HeaderView(title: "EgoLyfter", subtitle: "Move Some Serious Weight")

                    
                    if !viewModel.errMsg.isEmpty {
                        Text(viewModel.errMsg)
                            .foregroundColor(Color.red)
                    }
                    
                    //Form
                    VStack(alignment: .leading, spacing:15){
                        
                        TextField("Email", text: $viewModel.email)
                            .padding()
                            .background(Color("DemonRed").opacity(0.4))
                            .cornerRadius(20.0)
                            .autocapitalization(.none)
                        SecureField("Password", text: $viewModel.password)
                            .padding()
                            .background(Color("DemonRed").opacity(0.4))
                            .cornerRadius(20.0)
                            .autocorrectionDisabled()
                        
                       
                    }.padding([.top, .leading, .trailing], 27.5)
                    
                    FormButton(title: "Login", bgColor: Color("DemonRed")){
                        //attempt login
                        
                        viewModel.login()
                        
                    }
                    
                    Spacer()
                    
                    //Other Methods?
                    
                    //Register
                    
                    VStack {
                        Text("Haven't Committed Yet?")
                        NavigationLink("Create an Account", destination: RegisterView())
                    }.padding(.bottom, 10)
                    
                   
                }
            }
        }//End Main Vstack
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
