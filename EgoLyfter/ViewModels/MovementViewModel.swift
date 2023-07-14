//
//  MovementViewModel.swift
//  EgoLyfter
//
//  Created by Joel on 7/9/23.
//

import Foundation

class MovementViewModel: ObservableObject, Identifiable {
    
    var id: Int
    @Published var exerciseTitle:String = "New Exercise"
    @Published var setCount:Int = 0
    @Published var sets:[ExerciseSetView] = []
    @Published var weightPlaceHolder = ""
    
    
    
    
    init(id:Int){
        
        self.id = id
        
    }
    
    func addSet() -> Void {
        
        sets.append(ExerciseSetView(id: setCount, weight: weightPlaceHolder, reps: 12))
        
        setCount += 1
        
    }
    
    func save() {
        //will create viewModel from here
       // print(self.exerciseTitle)
        print(String(setCount))
        print(exerciseTitle)
        
    }
    
}
