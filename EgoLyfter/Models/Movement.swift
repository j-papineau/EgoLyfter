//
//  Movement.swift
//  EgoLyfter
//
//  Created by Joel on 7/15/23.
//

import Foundation
import SwiftUI

struct Movement: Identifiable {
    
    var id: Int
    var title: String
    var setCount: Int
    var sets:[MovementSet]
    var weight: String
    //go away from this
    var viewModel: MovementViewModel
    
    
    func save() {
        //might not need this ?
    }
}
