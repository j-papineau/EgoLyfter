//
//  FormButton.swift
//  EgoLyfter
//
//  Created by Joel on 6/30/23.
//

import SwiftUI

struct FormButton: View {
    
    let title:String
    let bgColor:Color
    let action:() -> Void
    
    
    //abstract text color pls
    
    
    var body: some View {
        
        Button{
            //action
            action()
            
        } label: {
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(bgColor)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
                
            }.frame(width: 300, height: 50)
                .padding()
        }
        
        
    }
}

struct FormButton_Previews: PreviewProvider {
    static var previews: some View {
        FormButton(title: "Login", bgColor: Color.blue){
            //action
        }
    }
}
