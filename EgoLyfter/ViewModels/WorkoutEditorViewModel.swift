//
//  WorkoutEditorViewModel.swift
//  EgoLyfter
//
//  Created by Joel on 7/4/23.
//
import FirebaseCore
import FirebaseFirestore
import Foundation


class WorkoutEditorViewModel: ObservableObject {
    
    //TODO: Create model like WorkoutListItem to get from firebase the customWorkouts data with query
    
    @Published var isPresentingConfirm = false
   // let title: String
    
   // @FirestoreQuery var items: [WorkoutListItem]
    private let userId: String
    let listId: String
    
    
    
    init(userId: String, listId:String){
        FirebaseApp.configure()
        let db = Firestore.firestore()
        
        self.userId = userId
        self.listId = listId
        
//        db.collection("users")
//            .document(userId)
//            .collection("customWorkouts")
//            .document(list)
        //FirestoreQuery(collectionPath: "/users/\(userId)/customWorkouts/\(listId)")
        
        
    }
    
    
    
    
}
