//
//  WorkoutListItemView.swift
//  EgoLyfter
//
//  Created by Joel on 6/30/23.
//

import SwiftUI

struct WorkoutListItemView: View {
   
    
    let item: WorkoutListItem
    //@StateObject var viewModel = WorkoutListItemViewModel()
    @StateObject var viewModel = WorkoutListItemViewModel()
    
    var body: some View {
        
 
 //       NavigationView {
            HStack{
                    Spacer()
                    
                    //title and subtitle
                    VStack{
                        Spacer()
                        Text(item.title)
                            .font(.system(size: 20))
                            .multilineTextAlignment(.leading).bold()
                        Text("created: " + "\(Date(timeIntervalSince1970: item.createdDate).formatted(date: .abbreviated, time: .shortened))")
                            //.font(.system(size:15))
                            .font(.footnote)
                            .foregroundColor(Color(.secondaryLabel))
                            .multilineTextAlignment(.leading)
                            .italic()
                       // Text("last done: " + lastDate)//probably a computed property
                        Spacer()
                    }.padding(.leading, 10)
                    
                    Button{
                        viewModel.toggleFav(item: item)
                        print("fav")
                        
                    }label:{
                        //set fav on click
                        Image(systemName: item.isFav ? "star.fill" : "star")
                            .foregroundColor(Color("DemonRedLight"))
                    }.padding()
                    .buttonStyle(.plain)
                
//                NavigationLink(destination: WorkoutEditorView()){
//                    //opens editor
//                    Image(systemName: "square.and.pencil")
//                }.padding()
//
//                NavigationLink(destination: ActiveWorkoutIDKSomething()){
//                    Image(systemName: "play")
//                }
                    
//                    Button{
//                        //open editor
//                        print("edit")
//
//                    }label:{
//                        Image(systemName: "square.and.pencil")
//                    }.padding()
//                        .buttonStyle(.plain)
//
//                    Button{
//                        //do workout
//                        print("play")
//                    } label: {
//                        Image(systemName: "play")
//                    }.padding()
//                        .buttonStyle(.plain)
            }.frame(height: 50) //end hstack
//        }//end nav view
        
    }
}

struct WorkoutListItemView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutListItemView(item: WorkoutListItem(id: "123", title: "Testing", createdDate: Date().timeIntervalSince1970, isFav: true))
    }
}
