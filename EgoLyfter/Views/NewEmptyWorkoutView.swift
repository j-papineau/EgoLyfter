//
//  NewEmptyWorkoutView.swift
//  EgoLyfter
//
//  Created by Joel on 7/8/23.
//

import SwiftUI

struct NewEmptyWorkoutView: View {
   
    @StateObject var viewModel = NewEmptyWorkoutViewModel()
    @Binding var showingEmptyWorkoutView: Bool
    @State var isShowingAlert: Bool = false
    @State var isShowingFinishedScreen = false
    
    
  
    
    
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView{
            
            VStack{

                List{

                    ForEach($viewModel.movements){movement in
                        MovementView(movement: movement)
                    }
                }.listStyle(.plain)
               

                Spacer()
                
                HStack{
                    Button{
                        //add movement
                        viewModel.addMovement()
                    } label: {
                        HStack{
                            Image(systemName: "plus")
                            Text("Add Movement")
                        }.buttonStyle(BorderedButtonStyle())
                    }
                    .buttonStyle(.bordered)
                    .padding(.leading, 15)
                    
                   //     Spacer()
                    
//                    Button{
//                            //add cadio log
//                    } label: {
//                        HStack{
//                            Image(systemName: "plus")
//                            Text("Add Cardio Log")
//                        }
//                    }
//                        .buttonStyle(.bordered)
//                        .padding(.trailing, 15)
                }
            }
            
            
            .navigationTitle($viewModel.workoutTitle)
            .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                        ToolbarItem(placement: .navigationBarLeading){
                            
                            HStack {
                                Image(systemName: "timer").foregroundColor(Color.blue)
                                Text("\(viewModel.stopwatch)")
                                    .onReceive(timer){ firedDate in
                                        viewModel.timeElapsed = Int(firedDate.timeIntervalSince(viewModel.startDate))
                                        viewModel.stopwatch = viewModel.convertToTime(viewModel.timeElapsed)
                                       // print(viewModel.timeElapsed)
                                    }.foregroundColor(Color.blue)
                            }
                            
                        }
                        ToolbarItem(placement: .navigationBarTrailing){
                            Button("Finish"){
                                //save workout
                                isShowingAlert = true
                               // showingEmptyWorkoutView = false
                            }.buttonStyle(BorderedButtonStyle())
                                .alert("Finish Workout?", isPresented: $isShowingAlert){
                                    Button("Yes"){
                                        //attempt save and exit
                                        isShowingAlert = !viewModel.saveWorkout()
                                        if !isShowingAlert {
                                            //show finish screen
                                            isShowingFinishedScreen = true
                                        }
                                        
                                    }
                                    Button("Not yet"){
                                        isShowingAlert = false
                                    }
                                }
                        }
                }
        }
        .sheet(isPresented: $isShowingFinishedScreen , onDismiss: {
            showingEmptyWorkoutView = false
        }) {
            //finished workout view
            
            let sets = viewModel.getSetsCompleted()
            let totalWeight = viewModel.getTotalWeight()
            let duration = viewModel.stopwatch
            
            WorkoutFinishedView(title: viewModel.workoutTitle, exerciseCount: viewModel.movementCount, sets: sets, duration: duration, totalWeight: totalWeight)
            
        }
    }
}

struct NewEmptyWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        NewEmptyWorkoutView(showingEmptyWorkoutView: Binding.constant(true))
    }
}
