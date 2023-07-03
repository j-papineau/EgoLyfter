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
                    
                    ProfileCardView(username: "Test User", email: "test@gmail.com", imgName: "avacado-maki", joinedYear: "1999", bgColor: Color.clear)
                        .offset(y:10)
                    
                    List{
                        Text("Something").foregroundColor(Color.black)
                    }
                    Spacer()
                    
                }.navigationTitle("Your Profile")
                
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
