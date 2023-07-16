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
    @Published var movements:[Movement] = []
    @Published var movementCount:Int = 0
    
    
    
    
    init(){
       
        
    }
    
    
    
    func addMovement() -> Void {
        
        movements.append(Movement(id: movementCount, title: "New Exercise", setCount: 0, sets: [], weight: "69", viewModel: MovementViewModel(id: movementCount)))
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
        
        //print data to console for testing
//        print("Workout Title: " + workoutTitle)
//        print("Duration: " + stopwatch)
//        print("Number of Exercises: " + String(movementCount))
//        print("- - - - - - - -")
//
//        for movement in movements {
//
//            movement.viewModel.save()
//        }
//
        //implement this eventually for validation
        //let savable:Bool = canSave()
        
//        //check validation
//        guard savable else{
//            print("error")
//            return false
//        }
//
//        //verify user id
        guard let uId = Auth.auth().currentUser?.uid else {
            print("error")
            return false
        }

        //prepare model
        
        let newId = UUID().uuidString
        let date = Date()
        
        var movementsDB:[DBMovement] = []
        
        for movement in movements {
            movementsDB.append(movement.viewModel.createDBModel())
        }

        let newItem = EmptyWorkout(id: newId, created: date.timeIntervalSince1970, duration: stopwatch, title: workoutTitle, movementCount: movementCount,movements: movementsDB)

        let db = Firestore.firestore()
        
        do{
            try db.collection("users")
                .document(uId)
                .collection("Workout_History")
                .addDocument(from: newItem)
        }catch{
            //TODO: actually handle DB errors here
            print("error writing data.")
        }
       
        
        

//        db.collection("users")
//            .document(uId)
//            .collection("Workout_History")
//            .document(newId)
//            .setData(newItem.asDictionary())
//
//        //save movements
//        for movement in movements {
//            movement.viewModel.saveMovement(uId: uId, workoutId: newId)
//        }
//        //save sets in movements
//        for movement in movements{
//            movement.viewModel.saveSets(uId: uId, workoutId: newId)
//        }
//
       
        
        return true
        
        
        
        
        
    }
    
    func canSave() -> Bool {
        
        //check and validate data
        return true //dummy for now
        
    }
    
    func getTotalWeight() -> Int {
        
        var runningTotal: Int = 0
        
        for movement in movements {
            let movementTotal = Int(movement.viewModel.getTotalWeight())
            runningTotal += movementTotal
        }
        
        return runningTotal
    }
    
    func getSetsCompleted() -> Int {
        
        var runningTotal: Int = 0
        
        for movement in movements {
            runningTotal += movement.viewModel.setCount
        }
        
        return runningTotal
    }
    
}
