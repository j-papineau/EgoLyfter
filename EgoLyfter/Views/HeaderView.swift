//
//  HeaderView.swift
//  EgoLyfter
//
//  Created by Joel on 6/30/23.
//

import SwiftUI

struct HeaderView: View {
    
    let fadeToClear = Gradient(colors: [Color.clear, Color.black])
    let fadeToBlack = Gradient(colors: [Color.black, Color.clear])
    let title:String
    let subtitle:String
    
    var body: some View {
        ZStack{
            ZStack{
                
                Rectangle().foregroundColor(Color("DemonRed"))
                Image("login-background").resizable()
                    .aspectRatio(contentMode: .fill)
                    .opacity(0.35)
            }
                .mask(LinearGradient(gradient: fadeToClear, startPoint: .bottom, endPoint: .center))
            .padding(.top, -60.0)
            VStack(spacing: 2.0){
                
                Text(title)
                    .font(.system(size:50))
                    .foregroundColor(Color.white)
                    .bold()
                Text(subtitle)
                    .italic()
                    .font(.system(size:15))
                    .foregroundColor(Color.white)
                Spacer()
                
            }
            .padding(.top, 40.0)//Header Text Stack
            
        }.frame(height: 250)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "EgoLyfter", subtitle: "Move Some Serious Weight")
    }
}
