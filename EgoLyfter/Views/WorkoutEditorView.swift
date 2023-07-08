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
    private var userId: String
    
    @State private var isPresentingConfirm: Bool = false
 
    var exercises: [ExerciseView] = []
    
    init(userId: String, listId: String, showingWorkoutEditor: Binding<Bool>){
        self.userId = userId
        self._showingWorkoutEditor = showingWorkoutEditor
        self._viewModel = StateObject(wrappedValue:
                                    WorkoutEditorViewModel(userId: userId,
                                    listId: listId))
       
    }
    
    
    
   // var listId: String
   // var userId: String
    
    
    
    var body: some View {
        
        //ScrollView {
            NavigationView{
                VStack {
                    
                    List(viewModel.exercises){item in
                                    VStack{
                                        ExerciseView(exerciseName: item.exerciseName, id: item.id)
                                    }.frame(height:400)
                                    .aspectRatio(contentMode: .fit)

                    }
                    .frame(maxHeight:.infinity)
                    //.listStyle(PlainListStyle())
                    .listStyle(InsetListStyle())
                        
                    .navigationTitle(viewModel.title)
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
                    
                    
                    //new exercise button
                    
                    FormButton(title: "+ Movement", bgColor: Color.blue){
                        //add exercise
                        
                        viewModel.addExercise()
                        
                    }
                    
                }.frame(maxHeight:.infinity)
        }
            .interactiveDismissDisabled()
    }
}

struct WorkoutEditorView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutEditorView(userId: "7eHaOMVXMLgQIH748yLPVESmZjj2",
                          listId: "BA6E62DD-E3EC-4AE9-A440-838E5C0BB607",
                          showingWorkoutEditor: Binding(get: {return true}, set: {_ in}))
        
    }
}
