//
//  WorkoutListItemView.swift
//  EgoLyfter
//
//  Created by Joel on 6/30/23.
//

import SwiftUI

struct WorkoutListItemView: View {
   
    var title:String
    var bgColor:Color
    var createdDate:String
    var lastDate:String
    
    var body: some View {
        
        ZStack{
            
            Rectangle().foregroundColor(bgColor).frame(height: 100)
            
            HStack{
                //icon
                Image(systemName: "scalemass").resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 50)
                    .padding(.leading, 10)
                
                Spacer()
                
                //title and subtitle
                VStack{
                    Spacer()
                    Text(title).font(.title).multilineTextAlignment(.leading).bold()
                    Text("created: " + createdDate)
                        .multilineTextAlignment(.leading)
                    Text("last done: " + lastDate)//probably a computed property
                    Spacer()
                }.padding(.leading, 10)
                
               
                
               
                
                //info button to view
                
                Spacer()
                
                Button{
                    
                }label:{
                    Image(systemName: "info.circle").resizable().aspectRatio(contentMode: .fit).frame(height: 25).padding(.trailing, 20)
                }
                
            }.frame(height: 100)//end main HStack
            
            
            
        }
        
    }
}

struct WorkoutListItemView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutListItemView(title: "Test Title", bgColor: Color.green.opacity(0.2), createdDate: "01/02/15", lastDate: "01/05/16")
    }
}
