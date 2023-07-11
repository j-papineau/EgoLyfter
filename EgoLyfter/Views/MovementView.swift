//
//  MovementView.swift
//  EgoLyfter
//
//  Created by Joel on 7/9/23.
//

import SwiftUI

struct MovementView: View, Identifiable{
    
    var id: Int
    @StateObject var viewModel: MovementViewModel
    
   // var exercises = [ExerciseSetView(id: 0, weight: "155", reps: 12),
//                     ExerciseSetView(id: 1, weight: "165", reps: 11),
//                     ExerciseSetView(id: 2, weight: "165", reps: 11)]
    
    init(id:Int){
        self.id = id
        self._viewModel = StateObject(wrappedValue: MovementViewModel(id: id))
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
            
            
            List(viewModel.sets) { item in
                ExerciseSetView(id: item.id, weight: item.weight, reps: item.reps)
            }.listStyle(.plain)
                .scrollIndicators(.visible)
            
            
            
            
            
            //FormButton(title: "Add Set", bgColor: Color.blue){}
            
            
            
            
        }.frame(height: 100 + CGFloat(viewModel.setCount) * 40)
    }
}

struct MovementView_Previews: PreviewProvider {
    static var previews: some View {
        MovementView(id: 1)
    }
}
