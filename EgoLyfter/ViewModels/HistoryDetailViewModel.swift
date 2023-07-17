//
//  HistoryDetailViewModel.swift
//  EgoLyfter
//
//  Created by Joel on 7/16/23.
//

import Foundation

class HistoryDetailViewModel: ObservableObject {
    
    @Published var workout: EmptyWorkout
    var dateDone:String {
        let toDate = Date(timeIntervalSince1970:workout.created)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/YYYY"
        return dateFormatter.string(from:toDate)
    }
    var timeDone:String {
        let toDate = Date(timeIntervalSince1970:workout.created)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:m a"
        return dateFormatter.string(from:toDate)
    }
    
    init(workout:EmptyWorkout){
        self.workout = workout
    }
    
    func prepareData() -> Void {
        
        
        
    }
    
    
}
