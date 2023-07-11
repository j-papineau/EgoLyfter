//
//  MovementSetViewModel.swift
//  EgoLyfter
//
//  Created by Joel on 7/10/23.
//

import Foundation


class MovementSetViewModel: ObservableObject, Identifiable {
    
    var id: Int
    @Published var repCount: Int = 12
    @Published var weight: String = ""
    
    
    
    init(id:Int){
        
        self.id = id + 1
        
    }
    
    
}
