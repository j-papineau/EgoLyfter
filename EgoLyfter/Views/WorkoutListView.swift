//
//  WorkoutItems.swift
//  EgoLyfter
//
//  Created by Joel on 6/30/23.
//
import FirebaseFirestoreSwift
import SwiftUI

//THIS is the home view

struct WorkoutListView: View {
    
    @StateObject var viewModel: WorkoutListViewModel
    @FirestoreQuery var items: [WorkoutListItem]
    @State var showingWorkout: Bool = false
    
    private var userId: String
    
    
    init(userId: String){
        self.userId = userId
        //users/<id>/customWorkouts/<entries>
        self._items = FirestoreQuery(collectionPath: "/users/\(userId)/customWorkouts")
        
        self._viewModel = StateObject(
            wrappedValue: WorkoutListViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView{
            VStack{
               
                NavigationView {
                    List(items) {item in
                            
                            HStack {
                                
                                
                               // NavigationLink(destination: WorkoutEditorView(listId: item.id)){
                                    
                                    HStack {
                                        WorkoutListItemView(item: item)
                                            .swipeActions{
                                                Button("Delete"){
                                                    viewModel.delete(id: item.id)
                                                }.foregroundColor(Color.red)
                                        }.tint(.red)
                                        Button{
                                            //open editor
                                            
                                            viewModel.showingWorkoutEditor = true
                                            viewModel.workoutEditorId = item.id
                                            print("editor on id:" + item.id)
                                            
                                            
                                        }label: {
                                            Image(systemName: "square.and.pencil")
                                        }.buttonStyle(.plain)
                                        
                                    }//end hstack
                            //    }//end navlink
                            }
                        }
                    .listStyle(InsetListStyle())
                }
                   // .listStyle(PlainListStyle())
                
                
            }
            .navigationTitle("Your Lifts")
            .toolbar{
                    Button{
                      //add new
                        viewModel.showingNewWorkoutView = true
                    }label:{
                        Image(systemName: "plus").foregroundColor(Color("DemonRedLight"))
                    }
                    
//                    Button{
//                        //settings??
//                        ///idk tbh
//                    }
//                    label:{
//                    Image(systemName: "slider.horizontal.3")
//                            .foregroundColor(Color("DemonRed"))
//                    }
                
            }.sheet(isPresented: $viewModel.showingNewWorkoutView){
                NewWorkoutView(newWorkoutPresented: $viewModel.showingNewWorkoutView)
            }.fullScreenCover(isPresented: $viewModel.showingWorkoutEditor){
                WorkoutEditorView(userId: userId, listId: viewModel.workoutEditorId, showingWorkoutEditor: $viewModel.showingWorkoutEditor)
                
            }
//            .sheet(isPresented: $viewModel.showingWorkoutEditor){
//                WorkoutEditorView(showingWorkoutEditor: $viewModel.showingWorkoutEditor, listId: viewModel.workoutEditorId)
//            }
        }
    }
}

struct WorkoutItems_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutListView(userId: "7eHaOMVXMLgQIH748yLPVESmZjj2")
    }
}
