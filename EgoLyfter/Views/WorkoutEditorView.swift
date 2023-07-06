//
//  WorkoutEditorView.swift
//  EgoLyfter
//
//  Created by Joel on 7/4/23.
//
//import FirebaseAuth
import FirebaseFirestoreSwift
import SwiftUI

struct WorkoutEditorView: View {
    
    //vars
    
    @Binding var showingWorkoutEditor: Bool
    @StateObject var viewModel: WorkoutEditorViewModel
    
    init(userId: String, listId: String, showingWorkoutEditor: Binding<Bool>){
        //self.userId = userId
        self._showingWorkoutEditor = showingWorkoutEditor
        self._viewModel = StateObject(wrappedValue: WorkoutEditorViewModel(userId: userId,
                                                                           listId: listId))
    }
    
    
    @State private var isPresentingConfirm: Bool = false
    //exercises needs id auto increment??
    var exercises = [ExerciseView(exerciseName: "DB Incline Press", id: 1),
                     ExerciseView(exerciseName: "Some sort of heavy pressing movement", id:2),
                     ExerciseView(exerciseName: "Lat Raise", id: 3)]
   // var listId: String
   // var userId: String
    
    
    
    var body: some View {
        
        //ScrollView {
            NavigationView{
                VStack {
                    
                    //test text to see if id is coming in properly
                    Text("ID: " + viewModel.listId)
                    
                    List(exercises){item in
                                    VStack{
                                        ExerciseView(exerciseName: item.exerciseName, id: item.id)
                                    }.frame(height:400)
                                    .aspectRatio(contentMode: .fit)
                    }
                    .frame(maxHeight:.infinity)
                    .listStyle(InsetListStyle())
                        
                        .navigationTitle("DA CHEST DAY")
                        .toolbar{
                            
                            ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                                Button{
                                    isPresentingConfirm = true
                                } label: {
                                    Image(systemName: "x.square").foregroundColor(Color("DemonRedLight"))
                                }.padding(.leading, 10)
                                    .alert("Save Changes Before Leaving?", isPresented: $isPresentingConfirm){
                                     
                                        Button("Save and Exit"){
                                            //save
                                            
                                            
                                            
                                            //exit
                                            showingWorkoutEditor = false
                                        }
                                        
                                        Button("Exit Without Saving", role:.destructive){
                                            //just leave
                                            showingWorkoutEditor = false
                                        }
                                    }
                            }
                            
                            
                            
                            ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
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
                }.frame(maxHeight:.infinity)
        }
            .interactiveDismissDisabled()
    }
}

struct WorkoutEditorView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutEditorView(userId: "7eHaOMVXMLgQIH748yLPVESmZjj2", listId: "23", showingWorkoutEditor: Binding(get: {return true}, set: {_ in}))
        
    }
}
