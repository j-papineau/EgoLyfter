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
    
    init(userId: String){
        self.userId = userId
        
        self._items = FirestoreQuery(collectionPath: "/users/\(userId)/Workout_History")
        self._viewModel = StateObject(wrappedValue: HistoryViewModel())
        
    }
    
    var body: some View {
        VStack{
            List(items){item in
                VStack{
                    Text(item.title)
                    let date = Date(timeIntervalSince1970: item.created)
                    let dateString = convDate(input: date)
                    
                    Text(dateString).font(.caption2)
                }
                
            }
        }
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


