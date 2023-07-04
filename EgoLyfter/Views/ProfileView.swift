//
//  ProfileView.swift
//  EgoLyfter
//
//  Created by Joel on 6/30/23.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    
    var body: some View {
        NavigationView{
            
            ScrollView {
                
                VStack{
                    if let user = viewModel.user{
                        ProfileCardView(username: user.name,
                                        email: user.email,
                                        imgName: "personcircle",
                                        joined: user.joined,
                                        bgColor: Color.clear)
                            .offset(y:10)
                        
                        List{
                            Text("Something").foregroundColor(Color.black)
                        }
                        FormButton(title: "Log Out", bgColor: Color("DemonRedLight")){
                            viewModel.logOut()
                        }
                    }else{
                        //loading state
                        Spacer()
                        Text("Loading Profile...")
                        
                    }
                    
                   
                    
                    Spacer()
                    
                }.navigationTitle("Your Profile")
                
            }
        }.onAppear{
            viewModel.fetchUser()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
