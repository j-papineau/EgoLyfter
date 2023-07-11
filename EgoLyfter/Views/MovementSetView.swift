//
//  MovementSetView.swift
//  EgoLyfter
//
//  Created by Joel on 7/10/23.
//

import SwiftUI

struct MovementSetView: View {
    
    @StateObject var viewModel:MovementSetViewModel
    var id: Int
    
    
    
    init(id:Int){
        self.id = id
        self._viewModel = StateObject(wrappedValue: MovementSetViewModel(id: id))
    }
    
    var body: some View {
        HStack{
            Spacer()
            Text(String(viewModel.id))
                .foregroundColor(Color.black)
                .bold()
                .padding(.all, 15)
                .background(Color.gray)
                .cornerRadius(16)
                .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color("DemonRedLight"), lineWidth: 4))
            Spacer()
            TextField("Sample Weight", text: $viewModel.weight)
                .padding(.all, 10)
                .background(Color.gray)
                .cornerRadius(20)
                .frame(width: 100)
                .foregroundColor(Color.black)
            Spacer()
            
            
        }
    }
}

struct MovementSetView_Previews: PreviewProvider {
    static var previews: some View {
        MovementSetView(id: 0)
    }
}
