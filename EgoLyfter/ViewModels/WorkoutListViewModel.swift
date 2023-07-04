//
//  WorkoutListViewModel.swift
//  EgoLyfter
//
//  Created by Joel on 6/30/23.
//
import FirebaseFirestore
import Foundation

class WorkoutListViewModel: ObservableObject {
    
    @Published var showingNewWorkoutView = false
    private let userId: String
    
    
    init(userId: String){
        self.userId = userId
    }
    
    
    ///deletes workout list item
    ///does not affect underlying docs must change (i.e. sets, etc.)
    func delete(id: String){
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("customWorkouts")
            .document(id)
            .delete()
        
        
        
        
        
    }
    
    
    
}
