//
//  ProfileCardView.swift
//  EgoLyfter
//
//  Created by Joel on 6/30/23.
//

import SwiftUI

struct ProfileCardView: View {
    
    let username:String
    let email:String
    let imgName:String
    let joined:TimeInterval
    let bgColor:Color
    
    @State var selected: Bool = false
    
    var body: some View {
        ZStack{
            //Rectangle().background(bgColor).opacity(0.2).cornerRadius(10) ///can remove this after testing
            HStack{
                
                //Image on tap present option to change or upload new
                
                
                    Image(systemName: "person.circle").resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height:100)
                        .cornerRadius(100)
                        .padding()
                        .foregroundColor(Color.gray)
                
                    
                
                
                
                
                
                    
                
                VStack(alignment: .leading){
                    
                    Text(username)
                        .font(.system(size:30))
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.leading)
                        .bold()
                    Text(email)
                        .font(.system(size:15))
                        .multilineTextAlignment(.leading)
                        
                        .foregroundColor(Color.gray)
                    Text("You joined: " + Date(timeIntervalSince1970: joined).formatted(date: .abbreviated, time: .omitted))
                        .font(.system(size:10))
                        .multilineTextAlignment(.center)
                        .padding([.top, .leading], 10.0)
                        .italic()
                    
                }
                .padding(.leading, 10.0)
                
                
                Spacer()
                
                VStack{
                    
                    
                    Button{
                        //settings??
                        ///idk tbh
                    }
                    label:{
                    Image(systemName: "slider.horizontal.3")
                    }
                    
                }.padding()
                
                
                
            }
        }.frame(height: 100)
    }
}

struct ProfileCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCardView(username: "Joel", email: "test@gmail.com", imgName: "avocado-maki", joined: 999999999, bgColor: Color.gray)
    }
}
