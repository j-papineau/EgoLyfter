//
//  RegisterView.swift
//  EgoLyfter
//
//  Created by Joel on 6/30/23.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        NavigationView {
            ZStack{
                //Rectangle().fill().offset(y:40)
                VStack{
                    //Header
                    HeaderView(title: "Create Account", subtitle: "It's Time To Make Some Changes")
                    
                    
                    if !viewModel.errMsg.isEmpty {
                        Text(viewModel.errMsg)
                            .foregroundColor(Color.red)
                    }

                    ScrollView{
                        
                        ZStack{
                            
                            Rectangle().foregroundColor(Color.white).opacity(0.1).shadow(radius: 20)
                                .cornerRadius(10)
                            
                            VStack(alignment: .leading, spacing:15) {
                                TextField("Name", text: $viewModel.name)
                                    .textFieldStyle(DefaultTextFieldStyle()).autocorrectionDisabled()
                                    .padding()
                                TextField("Email", text: $viewModel.email)
                                    .textFieldStyle(DefaultTextFieldStyle()).autocapitalization(.none).autocorrectionDisabled()
                                    .padding()
                                SecureField("Password", text: $viewModel.password).autocorrectionDisabled()
                                    .padding()
                                    .textFieldStyle(DefaultTextFieldStyle())
                                
                                FormButton(title: "Register", bgColor: Color("DemonRed")){
                                    
                                    //attempt register
                                    viewModel.register()
                                }
                                
                            }.padding([.top, .leading, .trailing, .bottom], 27.5)
                            .offset(y: -20)
                            
                        }//end z stack
                    }//end scroll view
                    
                    
                   //flavor Text ???
                    Spacer()
                    
                    
                    HStack {
                        NavigationLink("Terms of Service", destination: TermsView())
                        Image(systemName: "scalemass")
                        NavigationLink("Your Data is Private", destination: DataPrivacyView())
                        
                    }
                    
                    
                }.offset(y:-50)    //end main VStack
            }
        }
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
