//
//  NewWorkoutViewModel.swift
//  EgoLyfter
//
//  Created by Joel on 6/30/23.
//

import Foundation

class NewWorkoutViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var date = Date()
    @Published var showAlert = false
    
    
    
    func save(){
        print("Saving workout title and shit")
    }
    
    var canSave: Bool {
        
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        return true
        
    }
    init(){}
    
    
}
