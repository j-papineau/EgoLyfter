//
//  MovementView.swift
//  EgoLyfter
//
//  Created by Joel on 7/9/23.
//

import SwiftUI

struct MovementView: View, Identifiable{
    
    var id: Int
    @Binding var viewModel: MovementViewModel
    @Binding var movement:Movement

    
    init(movement: Binding<Movement>){
        self.id = movement.id
        self._movement = movement
        self._viewModel = movement.viewModel
       
    }
    
    var body: some View {
        VStack{

            HStack {
                TextField(viewModel.exerciseTitle, text: $viewModel.exerciseTitle)
                    .padding(.all, 5)
                    .background(Color.gray)
                    .cornerRadius(10)
                .frame(width: 200)
                Spacer()
                
                Button("Add Set"){
                    
                    viewModel.addSet()
                  //  print(viewModel.exerciseTitle)
                    
                }.buttonStyle(.borderedProminent)
               
            }.padding(.bottom, 10)
            
            HStack{
                Text("Set").bold()
                Spacer()
                Text("Weight").bold()
                Spacer()
                Text("Reps").bold()
                Spacer()
            }//table titles
            
            
            List($viewModel.sets) { item in
                ExerciseSetView(setData: item)
            }.listStyle(.plain)
                .scrollIndicators(.visible)
            
            
            
            
            
            //FormButton(title: "Add Set", bgColor: Color.blue){}
            
            
            
            
        }.frame(height: 100 + CGFloat(viewModel.setCount) * 40)
    }
}

struct MovementView_Previews: PreviewProvider {
    static var previews: some View {
        MovementView(movement: Binding.constant(Movement(id: 0, title: "Title", setCount: 1, sets: [], weight: "225", viewModel: MovementViewModel(id: 0))))
    }
}
