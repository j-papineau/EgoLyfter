//
//  ExerciseView.swift
//  EgoLyfter
//
//  Created by Joel on 7/4/23.
//

import SwiftUI

struct ExerciseView: View, Identifiable {
    

    var id: Int
    var exerciseName:String
    @StateObject var viewModel: ExerciseViewModel
    
    
    init(exerciseName:String, id:Int){
        
        self.id = id
        self.exerciseName = exerciseName
        
        self._viewModel = StateObject(wrappedValue: ExerciseViewModel(exerciseName: exerciseName, id: id))
        
    }
    
    
    var body: some View {
            //title handled in list header
        
        
        VStack {
            
            
            //ListHeader(title: $viewModel.exerciseName)
            HStack(alignment: .center){
                
                TextField(text: $viewModel.exerciseName){
                    
                }
                .frame(width:350)
                .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(Color.gray, lineWidth: 2))
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
            
            }
            
            List(viewModel.sets){ item in
                
                ExerciseSetView(id: item.id, weight: item.weight, reps: item.reps)
                
            }
            //ListFooter(sets: $viewModel.sets)
            
            FormButton(title: "Add Set", bgColor: Color.green){
                //add set
                viewModel.addSet()
                
            }
            
            Spacer()
        }
        
        //.fixedSize(horizontal: false, vertical: true)
    }//end view
}//end struct

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(exerciseName: "DB Incline Press", id:2)
    }
}



