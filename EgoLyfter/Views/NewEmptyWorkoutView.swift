//
//  NewEmptyWorkoutView.swift
//  EgoLyfter
//
//  Created by Joel on 7/8/23.
//

import SwiftUI

struct NewEmptyWorkoutView: View {
   
    @StateObject var viewModel = NewEmptyWorkoutViewModel()
    
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView{
            
            HStack{
                Text("Something")
                
                
                
            }
            
            
            
            
            
            
                .navigationTitle("New Workout")
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        
                        HStack {
                            Image(systemName: "timer").foregroundColor(Color.blue)
                            Text("\(viewModel.stopwatch)")
                                .onReceive(timer){ firedDate in
                                    viewModel.timeElapsed = Int(firedDate.timeIntervalSince(viewModel.startDate))
                                    viewModel.stopwatch = viewModel.convertToTime(viewModel.timeElapsed)
                                    print(viewModel.timeElapsed)
                                }.foregroundColor(Color.blue)
                        }
            
                    }
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button("Save"){
                            //save workout
                        }.buttonStyle(BorderedButtonStyle())
                    }
                }
            
        }
    }
}

struct NewEmptyWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        NewEmptyWorkoutView()
    }
}
