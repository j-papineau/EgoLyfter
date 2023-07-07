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
    @Published var title: String
    private let userId: String
    let listId: String
    @Published var exercises:[ExerciseView] = []
    @Published var exerciseCount:Int = 0
    
    
    
    init(userId: String, listId:String){
        
        
        self.userId = userId
        self.listId = listId
        
        //init title to "" then set with func
        self.title = ""
        getTitle()
        
        }
        
       
    
        private func getTitle(){
            
            let docRef = Firestore.firestore()
            .collection("users")
            .document(self.userId)
            .collection("customWorkouts")
            .document(self.listId)
            
            docRef.getDocument{ (document, error) in
             guard let document = document, document.exists else {
                 print("Error fetching doc")
                 return
             }
             //attempt fetch
             let dataDescription = document.data()
             //*crosses fingers and poots*
             //print(dataDescription?["title"] ?? "")
              //  let title = dataDescription?["title"] as? String ?? ""
                self.title = dataDescription?["title"] as? String ?? ""
            }
            return
        }//end get Title
    
    
    //add exercise func
    
    func addExercise(){
        
        self.exercises.append(ExerciseView(exerciseName: "New Movement", id: self.exerciseCount))
        self.exerciseCount += 1
        
    }
    
    
    
    
    
    }//end class
    

