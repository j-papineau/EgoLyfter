//
//  ExerciseViewModel.swift
//  EgoLyfter
//
//  Created by Joel on 7/7/23.
//

import Foundation


class ExerciseViewModel: ObservableObject {
    
    @Published var exerciseName:String
    var id:Int
    //@Published var id: Int
    @Published var sets:[ExerciseSetView] = []
    var setCount: Int = 0
    
    init(exerciseName:String, id:Int){
        
        self.exerciseName = exerciseName
        self.id = id
        
        
    }
    
    func addSet(){
        
        //add set
        self.sets.append(ExerciseSetView(id: setCount, weight: "0", reps: 0))
        setCount += 1
        
    }
    
}
