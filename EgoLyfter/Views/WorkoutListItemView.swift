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
        
        ZStack{
            
            //Rectangle().foregroundColor(bgColor).frame(height: 100)
            
            HStack{
                //icon
                Image(systemName: "scalemass").resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 50)
                    .padding(.leading, 10)
                
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
                
               Spacer()
                
                //fav button

                Button{
                    viewModel.toggleFav(item: item)
                    
                }label:{
                   
                    //set fav on click
                    
                    Image(systemName: item.isFav ? "star.fill" : "star")
                        .foregroundColor(Color("DemonRedLight"))
                    
                }
                
                //info button to view
                Spacer()
                
                Button{
                    //do something
                    
                }label:{
                    Image(systemName: "square.and.pencil")
                }
            }.frame(height: 50)//end main HStack
        }
        
    }
}

struct WorkoutListItemView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutListItemView(item: WorkoutListItem(id: "123", title: "Testing", createdDate: Date().timeIntervalSince1970, isFav: true))
    }
}
