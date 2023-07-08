//
//  NewEmptyWorkoutViewModel.swift
//  EgoLyfter
//
//  Created by Joel on 7/8/23.
//

import Foundation

class NewEmptyWorkoutViewModel: ObservableObject {
    
    @Published var startDate = Date.now
    @Published var timeElapsed: Int = 0
    @Published var stopwatch: String = "00:00:00"
    
    
    init(){
       
        
        
        
    }
    
    func convertToTime(_ seconds: Int) -> String {
        
        let hours = seconds / 3600
        let mins = (seconds % 3600) / 60
        let seconds = (seconds % 3600) % 60
        
        
        var hoursString = ""
        if hours < 10 {
            hoursString = "0" + String(hours)
        }else{
            hoursString = String(hours)
        }
        
        var minsString = ""
        if mins < 10 {
            minsString = "0" + String(mins)
        }else{
            minsString = String(mins)
        }
        
        var secsString = ""
        if seconds < 10 {
            secsString = "0" + String(seconds)
        }else{
            secsString = String(seconds)
        }
        
       
        
        
        let time = hoursString + ":" + minsString + ":" + secsString
        
        return time
        
    }
    
    
}
