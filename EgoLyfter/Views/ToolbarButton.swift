//
//  ToolbarButton.swift
//  EgoLyfter
//
//  Created by Joel on 7/7/23.
//

import SwiftUI

struct ToolbarButton: View {
    var body: some View {
//        ZStack{
//            RoundedRectangle(cornerRadius: 20).foregroundColor(Color.blue)
//            Text("Hello").foregroundColor(Color.white)
//        }.frame(width: 75,height: 40)
        HStack{
            Button("Hello"){
                
            }.buttonStyle(BorderedButtonStyle())
        }
    }
}

struct ToolbarButton_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarButton()
    }
}
