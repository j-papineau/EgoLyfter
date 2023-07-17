//
//  WorkoutItems.swift
//  EgoLyfter
//
//  Created by Joel on 6/30/23.
//
import FirebaseFirestoreSwift
import SwiftUI

//THIS is the home view

enum ListSection:String, CaseIterable{
    case templates = "Templates"
    case history = "History"
}

struct WorkoutListView: View {
    
    @StateObject var viewModel: WorkoutListViewModel
    @FirestoreQuery var items: [WorkoutListItem]
    @State var showingWorkout: Bool = false
    @State private var mode: Int = 0
   
    
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
               
                VStack {
                    //gotta get the value from here
                  
                   //top selection thing
                  
                    
                    
                    NavigationView {
                        
                        
                        if mode == 0{ List(items) {item in
                            
                            HStack {
                                HStack {
                                    WorkoutListItemView(item: item)
                                        .swipeActions{
                                            Button("Delete"){
                                                viewModel.delete(id: item.id)
                                            }.foregroundColor(Color.red)
                                        }.tint(.red)
                                    
                                    HStack(spacing: 30){
                                        
                                        Button{
                                            //open editor
                                            viewModel.showingWorkoutEditor = true
                                            viewModel.workoutEditorId = item.id
                                            print("editor on id:" + item.id)
                                            
                                            
                                        }label: {
                                            Image(systemName: "square.and.pencil")
                                        }.buttonStyle(.plain)
                                        
                                        
                                        Button{
                                            //play workout
                                            print("playing workout:" + item.id)
                                            
                                        } label: {
                                            
                                            
                                            Image(systemName: "play")
                                        }.buttonStyle(.plain)
                                    }
                                }//end hstack
                            }
                        }//end list
                        .listStyle(InsetListStyle())
                        }
                        
                        else if mode == 1{
                            HistoryView(userId: userId)
                        }
                        
                        
                    }
                }
                   // .listStyle(PlainListStyle())
            }
            .navigationTitle("Home").navigationBarTitleDisplayMode(.inline)
            .toolbar{
                
               
                               ToolbarItem(placement: .principal) {
                                   Picker("Color", selection: $mode) {
                                       Text("Templates").tag(0)
                                       Text("History").tag(1)
                                   }
                                   .pickerStyle(SegmentedPickerStyle())
                               }
                           
                
                ToolbarItem{
                    Menu{
                        
                        Button{
                            //add new
                            //new template
                            viewModel.showingNewWorkoutView = true
                        }label:{
                            Text("New Template").foregroundColor(Color("DemonRedLight"))
                        }
                        
                        
                        Button("Start Empty Workout"){
                            
                            //start empty workout (duh)
                            
                            viewModel.showingEmptyWorkoutView = true
                            
                            
                            
                        }.buttonStyle(BorderedButtonStyle())
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
               
                    
                
                
            }.sheet(isPresented: $viewModel.showingNewWorkoutView){
                NewWorkoutView(newWorkoutPresented: $viewModel.showingNewWorkoutView)
            }.fullScreenCover(isPresented: $viewModel.showingWorkoutEditor){
                //workout editor
                WorkoutEditorView()
                
            }.fullScreenCover(isPresented: $viewModel.showingEmptyWorkoutView){
                NewEmptyWorkoutView(showingEmptyWorkoutView: $viewModel.showingEmptyWorkoutView)
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
