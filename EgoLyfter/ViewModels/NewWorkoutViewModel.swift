//
//  NewWorkoutViewModel.swift
//  EgoLyfter
//
//  Created by Joel on 6/30/23.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation


class NewWorkoutViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var date = Date()
    @Published var showAlert = false
    
    init(){}
    
    func save(){
        guard canSave else{
            return
        }
        
        //get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        //create model
        let newId = UUID().uuidString
        //placeholder issue??
        //let now = Date()
        let newItem = WorkoutListItem(id: newId,
                                    title: title,
                                      createdDate: date.timeIntervalSince1970,
                                    isFav: false)
        
        //save model to db
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("customWorkouts")
            .document(newId)
            .setData(newItem.asDictionary())
        
        
        
    }
    
    var canSave: Bool {
        
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        return true
        
    }
   
    
    
}
