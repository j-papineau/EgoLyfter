//
//  MovementViewModel.swift
//  EgoLyfter
//
//  Created by Joel on 7/9/23.
//


import FirebaseAuth
import FirebaseFirestore
import Foundation

class MovementViewModel: ObservableObject, Identifiable {
    
    var id: Int
    @Published var exerciseTitle:String = "New Exercise"
    @Published var setCount:Int = 0
    @Published var sets:[MovementSet] = []
    @Published var weightPlaceHolder = ""
    
    
    
    
    init(id:Int){
        
        self.id = id
        
    }
    
    func addSet() -> Void {
        
        sets.append(MovementSet(id: setCount, repCount: 12, weight: ""))
        
        setCount += 1
        
    }
    
    func printLog() {
        //will create viewModel from here
       // print(self.exerciseTitle)
        print("Exercise: " + String(id))
        print("Title: " + exerciseTitle)
        print("Set Count: " + String(setCount))
        
        for set in sets {
            print("set: " + String(set.id + 1))
            print("weight: " + String(set.weight))
            print("reps: " + String(set.repCount))
        }
        
        print("~~~~~~~~~~~")
    }
    
    //creates documents in FB for each movement
//    func saveMovement(uId:String, workoutId:String){
//        
//        //create model
//        
//        let item = DBMovement(id: String(id), title: exerciseTitle, setCount: setCount)
//        
//        let db = Firestore.firestore()
//        
//        db.collection("users")
//            .document(uId)
//            .collection("Workout_History")
//            .document(workoutId)
//            .collection("Movements")
//            .document(String(id))
//            .setData(item.asDictionary())
//        
//        
//    }
    
    func createDBModel() -> DBMovement{
        
        let newItem = DBMovement(id: id, title: exerciseTitle, setCount: setCount, sets: sets)
        return newItem
    }
    
    func saveSets(uId:String, workoutId:String){
        
        let db = Firestore.firestore()
        
        for item in sets{
            db.collection("users")
                .document(uId)
                .collection("Workout_History")
                .document(workoutId)
                .collection("Movements")
                .document(String(id))
                .collection("Sets")
                .document(String(item.id))
                .setData(item.asDictionary())
        }
        
       
        
    }
    
    func getTotalWeight() -> Int {
        
        var runningTotal: Int = 0
        
        for set in sets {
            let setWeight = Int(set.weight) ?? 0
            runningTotal += setWeight
        }
        
        return runningTotal
    }
    
    
}
