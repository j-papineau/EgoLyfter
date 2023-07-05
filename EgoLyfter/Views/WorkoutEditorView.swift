//
//  WorkoutEditorView.swift
//  EgoLyfter
//
//  Created by Joel on 7/4/23.
//

import SwiftUI

struct WorkoutEditorView: View {
    
    //vars
    @StateObject var viewModel = WorkoutEditorViewModel()
    //exercises needs id auto increment??
    var exercises = [ExerciseView(exerciseName: "DB Incline Press", id: 1),
                     ExerciseView(exerciseName: "Some sort of heavy pressing movement", id: 2)]
    
    var body: some View {
        
        //ScrollView {
            NavigationView{
                VStack {
                    List(exercises){item in
                                    VStack{
                                        ExerciseView(exerciseName: item.exerciseName, id: item.id).aspectRatio(contentMode: .fit)
                                    }.aspectRatio(contentMode: .fit)
                    }.listStyle(InsetListStyle())
                        
                        .navigationTitle("DA CHEST DAY")
                        .toolbar{
                            Button{
                                //save changes
                            }label: {
                                HStack{
                                    Text("Save")
                                    Image(systemName: "square.and.arrow.up")
                                }.foregroundColor(Color("DemonRedLight"))
                            }
                    }
                }
        }//end toolbar
    }
}

struct WorkoutEditorView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutEditorView()
    }
}
