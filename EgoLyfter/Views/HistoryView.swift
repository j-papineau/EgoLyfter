//
//  HistoryView.swift
//  EgoLyfter
//
//  Created by Joel on 7/4/23.
//
import FirebaseFirestoreSwift
import SwiftUI

struct HistoryView: View {
   
    private var userId: String
    @FirestoreQuery var items: [EmptyWorkout]
    @StateObject var viewModel: HistoryViewModel
    @State var loadWorkout:Bool = false
    
    init(userId: String){
        self.userId = userId
        
        self._items = FirestoreQuery(collectionPath: "/users/\(userId)/Workout_History")
        self._viewModel = StateObject(wrappedValue: HistoryViewModel())
        
    }
    
    var body: some View {
        
        NavigationView {
            VStack{
                List(items){item in
                    NavigationLink{
                        HistoryDetailView(workout: item, loadWorkout: $loadWorkout)
                    }label: {
                        VStack{
                            Text(item.title)
                            Text(convDate(input: Date(timeIntervalSince1970: item.created))).font(.caption).italic()
                        }
                    }
                    
                }.listStyle(.plain)
                   
            } .padding(.top, -50)
        }.fullScreenCover(isPresented: $loadWorkout){
            VStack{
                Text("workout will go here")
                FormButton(title: "Leave", bgColor: Color.red){
                    loadWorkout = false
                }
            }
           
        }//end fullscreen cover
    }
    
    
    func convDate(input:Date) -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/YYYY"
        let stringReturn = dateFormatter.string(from: input)
        return stringReturn
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(userId: "7eHaOMVXMLgQIH748yLPVESmZjj2")
    }
}


