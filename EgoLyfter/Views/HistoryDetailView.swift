//
//  HistoryDetailView.swift
//  EgoLyfter
//
//  Created by Joel on 7/16/23.
//

import SwiftUI

struct HistoryDetailView: View {
    
    var workout: EmptyWorkout
    @StateObject var viewModel: HistoryDetailViewModel
    
    init(workout:EmptyWorkout){
        self.workout = workout
        self._viewModel = StateObject(wrappedValue: HistoryDetailViewModel(workout: workout))
    }
    
    var body: some View {
        
        VStack{
            Text(viewModel.workout.title).font(.system(size: 30)).bold()
            
            List{
                
                HStack{
                    Image(systemName: "calendar")
                    Text(viewModel.dateDone)
                }
                
                HStack{
                    Image(systemName: "clock")
                    Text(viewModel.timeDone)
                }
                HStack{
                    Image(systemName: "timer")
                    Text(viewModel.workout.duration)
                }
                HStack{
                    Text("Total Exercises: ")
                    Text(String(viewModel.workout.movementCount))
                }
            }.frame(height:250)
            
            VStack(alignment: .leading){
                List(viewModel.workout.movements){item in
                    VStack{
                        Text(item.title)
                        VStack{
                            ForEach(item.sets){item in
                                HStack{
                                    Text("Set " + String(item.id) + ":")
                                    Text(item.weight)
                                }.padding([.top, .bottom], 1)
                            }
                        }
                    }
                }
            }
            
            FormButton(title: "Run It Again", bgColor: Color.green){
                //load this workout as a template in empty view
                print("go again")
            }
            
        }
    }
}

struct HistoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryDetailView(workout: EmptyWorkout(id: "1", created: 1688172220.592743 , duration: "00:13:23", title: "Test Title", movementCount: 2, movements: [
        //dummy data for exercises
            DBMovement(id: 0, title: "Bench", setCount: 1, sets: [
            MovementSet(id: 0, repCount: 12, weight: "225")]),
            DBMovement(id: 1, title: "Lateral Raise", setCount: 2, sets: [
            MovementSet(id: 0, repCount: 15, weight: "25"),
            MovementSet(id: 1, repCount: 14, weight: "25")])
        ]
        ))
    }
}
