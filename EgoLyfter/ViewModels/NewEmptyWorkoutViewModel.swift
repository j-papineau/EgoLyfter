//
//  NewEmptyWorkoutViewModel.swift
//  EgoLyfter
//
//  Created by Joel on 7/8/23.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewEmptyWorkoutViewModel: ObservableObject {
    
    @Published var startDate = Date.now
    @Published var timeElapsed: Int = 0
    @Published var stopwatch: String = "00:00:00"
    @Published var workoutTitle = "New Workout"
    @Published var movements:[MovementView] = []
    @Published var movementCount:Int = 0
    
    
    
    
    init(){
       
        
    }
    
    
    
    func addMovement() -> Void {
        
        movements.append(MovementView(id: movementCount))
        movementCount += 1
        
    }
    
    ///function that makes the timer work lol
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
    
    
    func saveWorkout() -> Bool {
        
        //let savable:Bool = canSave()
        
//        //check validation
//        guard savable else{
//            print("error")
//            return false
//        }
//
//        //verify user id
//        guard let uId = Auth.auth().currentUser?.uid else {
//            print("error")
//            return false
//        }
//
//        //create model
//        let newId = UUID().uuidString
//        let date = Date()
//
//        let newItem = EmptyWorkout(id: newId, created: date.timeIntervalSince1970, duration: stopwatch, title: workoutTitle, movementCount: movementCount)
//
//        let db = Firestore.firestore()
//
//        db.collection("users")
//            .document(uId)
//            .collection("Workout_History")
//            .document(newId)
//            .setData(newItem.asDictionary())
        
        for movement in movements {
            movement.viewModel.save()
        }
        
        return true
        
        
        
        
        
    }
    
    func canSave() -> Bool {
        
        //check and validate data
        return true //dummy for now
        
    }
    
    
}
