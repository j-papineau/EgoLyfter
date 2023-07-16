//
//  ExerciseSetView.swift
//  EgoLyfter
//
//  Created by Joel on 7/4/23.
//

import SwiftUI
import Combine

struct ExerciseSetView: View {
    //id for set needs to be handled
    @Binding var setData:MovementSet
    
    var body: some View {
        VStack{
            
            
            HStack{
               
                
                Text("\(setData.id + 1)").font(.headline).fontWeight(.heavy).multilineTextAlignment(.center)
                    .onTapGesture {
                            self.hideKeyboard()
                        }
                
                Spacer()
                
                
                TextField("", text: $setData.weight)
                    .keyboardType(.numberPad)
                    .onReceive(Just(setData.weight)){newValue in
                        let filtered = newValue.filter {"01234567890".contains($0)}
                        if filtered != newValue{
                            self.setData.weight = filtered
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
                
                Stepper("\(setData.repCount)", value: $setData.repCount).fixedSize()
                   
            }
        }
        
        
    }
}

struct ExerciseSetView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseSetView(setData:Binding.constant(MovementSet(id: 1, repCount: 2, weight: "225")))
    }
}
