//
//  ExerciseSetView.swift
//  EgoLyfter
//
//  Created by Joel on 7/4/23.
//

import SwiftUI
import Combine

struct ExerciseSetView: View, Identifiable {
    //id for set needs to be handled
    var id: Int
    @State var weight:String
    @State var reps: Int
    
    var body: some View {
        VStack{
            
            
            HStack{
               
                
                Text("\(id + 1)").font(.headline).fontWeight(.heavy).multilineTextAlignment(.center)
                    .onTapGesture {
                            self.hideKeyboard()
                        }
                
                Spacer()
                
                
                TextField("", text: $weight)
                    .keyboardType(.numberPad)
                    .onReceive(Just(weight)){newValue in
                        let filtered = newValue.filter {"01234567890".contains($0)}
                        if filtered != newValue{
                            self.weight = filtered
                        }
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 100)
                    .onTapGesture {
                        self.hideKeyboard()
                    }
                    //end on receive
                Text("lbs")
                    .font(.footnote)
                    .onTapGesture {
                        self.hideKeyboard()
                    }
                
                Spacer()
                
                Stepper("\(reps)", value: $reps).fixedSize()
                   
            }
        }
        
        
    }
}

struct ExerciseSetView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseSetView(id:2,weight: "182", reps: 12)
    }
}
