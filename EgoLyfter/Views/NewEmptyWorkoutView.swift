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
    
    
    
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView{
            
            VStack{
               
                List(viewModel.movements){movement in
                    
                    MovementView(id: movement.id)
                      //.frame(height: 230)
                        //.aspectRatio(contentMode: .fit)
                   // Spacer()
                    
                }
                .listStyle(.plain)
               
                
                
                
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
                    
                        Spacer()
                    
                    Button{
                            //add cadio log
                    } label: {
                        HStack{
                            Image(systemName: "plus")
                            Text("Add Cardio Log")
                        }
                    }
                        .buttonStyle(.bordered)
                        .padding(.trailing, 15)
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
                                
                                showingEmptyWorkoutView = false
                                
                                
                            }.buttonStyle(BorderedButtonStyle())
                        }
                    
                    //maybe bottome toolbar
                    
                }
            
        }
    }
}

struct NewEmptyWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        NewEmptyWorkoutView(showingEmptyWorkoutView: Binding.constant(true))
    }
}
