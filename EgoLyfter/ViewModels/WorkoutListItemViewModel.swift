//
//  WorkoutListItemViewModel.swift
//  EgoLyfter
//
//  Created by Joel on 6/30/23.
//


//LIST ITEM FOR HOME

import FirebaseAuth
import FirebaseFirestore
import Foundation


class WorkoutListItemViewModel: ObservableObject {
    
    init(){}
    
    func toggleFav(item: WorkoutListItem){
        var itemCopy = item
        itemCopy.setFav(!item.isFav)
        
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("customWorkouts")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
    }
    
}
