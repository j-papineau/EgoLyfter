//
//  Workout.swift
//  EgoLyfter
//
//  Created by Joel on 6/30/23.
//

import Foundation


struct WorkoutListItem: Codable, Identifiable{
    
    let id: String
    let title: String
    let createdDate: TimeInterval
    var isFav: Bool
    
    mutating func setFav(_ state: Bool){
        isFav = state
    }
    
    
}
