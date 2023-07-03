//
//  NewWorkoutView.swift
//  EgoLyfter
//
//  Created by Joel on 6/30/23.
//

import SwiftUI

struct NewWorkoutView: View {
    
    @StateObject var viewModel = NewWorkoutViewModel()
    @Binding var newWorkoutPresented: Bool
    
    var body: some View {
        VStack{
            Text("New Lift")
                .font(.system(size: 32))
                .bold()
                .foregroundColor(Color("DemonRed"))
                .padding(.top, 50)
            
            Form {
                //Title
                TextField("Title", text: $viewModel.title)
                   
                //maybe tags
                
                //Category??
                
                //Or build in this screen
                
                //Button to submit
                FormButton(title: "Add Lift", bgColor: Color("DemonRed")){
                    //attempt to upload to DB
                    if viewModel.canSave{
                        viewModel.save()
                        newWorkoutPresented = false
                    }
                    else{
                        viewModel.showAlert = true

                    }
                    
                }
                }.alert(isPresented: $viewModel.showAlert){
                    Alert(title: Text("Error"), message: Text("Title can not be blank"))
            }
            
            
        }
    }
}

struct NewWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        NewWorkoutView(newWorkoutPresented: Binding(get: {return true}, set: {_ in}))
    }
}
