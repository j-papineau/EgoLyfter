//
//  WorkoutItems.swift
//  EgoLyfter
//
//  Created by Joel on 6/30/23.
//

import SwiftUI

//THIS is the home view

struct WorkoutListView: View {
    
    @StateObject var viewModel = WorkoutListViewModel()
    private var userId: String
    
    
    init(userId: String){
        self.userId = userId
    }
    
    var body: some View {
        NavigationView{
            VStack{
               
                
                
            }
            .navigationTitle("Your Lifts")
            .toolbar{
                    Button{
                      //add new
                        viewModel.showingNewWorkoutView = true
                    }label:{
                        Image(systemName: "plus").foregroundColor(Color("DemonRed"))
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
        WorkoutListView(userId: "")
    }
}
