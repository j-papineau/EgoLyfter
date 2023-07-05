//
//  ExerciseView.swift
//  EgoLyfter
//
//  Created by Joel on 7/4/23.
//

import SwiftUI

struct ExerciseView: View, Identifiable {
    
    @State var exerciseName:String
    var id: Int
    

    @State var sets = [ExerciseSetView(id: 1,weight: "150", reps: 12), ExerciseSetView(id: 2, weight: "150", reps: 11)]
    
    var body: some View {
            //title handled in list header
        
        //TODO adjust list type format
        //maybe foreach is causing issue
        
        VStack {
            List{
                    Section(header: ListHeader(title: $exerciseName), footer: ListFooter(sets: $sets)){
                        ForEach(sets) { set in
                            ExerciseSetView(id: set.id, weight: set.weight, reps: set.reps)
                        }
                    }
            }
        }.aspectRatio(contentMode: .fit)
            .fixedSize(horizontal: false, vertical: true)
    }//end view
}//end struct

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(exerciseName: "DB Incline Press", id:2)
    }
}

struct ListHeader: View {
    @Binding var title: String
    var body: some View{
        HStack{
            Text(title).font(.system(size: 20)).bold()
        }
    }
}

struct ListFooter: View{
    
    @Binding var sets: [ExerciseSetView]
    
    var body: some View{
        HStack{
            FormButton(title: "Add Set", bgColor: Color.green){
                //add set with default values
                //FUTURE: take vals from set above it?
                //TODO: not pulling last element properly (not updating values, idk shoot me)
                
                //check for prev element
//                guard let prevId = sets[sets.count].id else{
//                    return
//                }
                
//                    if let lastSet = sets.last{
//                        print(lastSet)
//                        sets.append(ExerciseSetView(id: lastSet.id + 1,
//                                                    weight: lastSet.weight,
//                                                    reps: lastSet.reps))
//                    }
                
                    
                guard let lastSet = sets.last else{
                    return
                }
//
//                print(lastSet)
//
                sets.append(ExerciseSetView(id: lastSet.id + 1,
                                            weight: lastSet.weight,
                                            reps: lastSet.reps))

                
            }
        }
        
    }
}

