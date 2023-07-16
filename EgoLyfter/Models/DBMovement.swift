//
//  DBMovement.swift
//  EgoLyfter
//
//  Created by Joel on 7/16/23.
//

import Foundation

struct DBMovement: Identifiable, Codable {
    
    var id: Int
    var title: String
    var setCount: Int
    var sets:[MovementSet]
    
}
