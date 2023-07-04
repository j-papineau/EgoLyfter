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
               
                List(items) {item in
                    WorkoutListItemView(item: item)
                        .swipeActions{
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                            }.foregroundColor(Color.red)
                        }.tint(.red)
                }
                .listStyle(PlainListStyle())
                
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
            }
        }
    }
}

struct WorkoutItems_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutListView(userId: "7eHaOMVXMLgQIH748yLPVESmZjj2")
    }
}
