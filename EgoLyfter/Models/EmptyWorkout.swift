//
//  EmptyWorkout.swift
//  EgoLyfter
//
//  Created by Joel on 7/14/23.
//

import Foundation

struct EmptyWorkout: Codable, Identifiable {
    
    let id:String
    let created:TimeInterval
    let duration:String
    let title:String
    let movementCount:Int
    let movements:[DBMovement]
    
    
    
}
