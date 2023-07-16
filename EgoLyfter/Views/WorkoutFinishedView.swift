//
//  WorkoutFinishedView.swift
//  EgoLyfter
//
//  Created by Joel on 7/16/23.
//

import SwiftUI

struct WorkoutFinishedView: View {
   
    var title: String
    var exerciseCount: Int
    var sets: Int
    var duration: String
    var totalWeight: Int
    var quote: String = "The resistance that you fight physically in the gym and the resistance that you fight in life can only build a strong character."
    
    var body: some View {
        VStack{
            
            
            Text("Workout Completed").font(.system(size: 30)).bold()
            
            Image("cookie1").resizable().aspectRatio(contentMode: .fit)
            
            Text("Want a cookie? See you again tomorrow.").font(.footnote).italic()
            Spacer()
            
            VStack{
                
                Text("''" + title + "''")
                Spacer()
                HStack{
                    Image(systemName: "timer")
                    Text(duration)
                }
                Spacer()
                
                VStack{
                    Text("Your Stats").bold()
                    List{
                        HStack{
                            Text("Movements Completed: ")
                            Text(String(exerciseCount)).bold()
                        }
                        HStack{
                            Text("Sets Completed:")
                            Text(String(sets)).bold()
                        }
                       
                        HStack{
                            Text("Weight Moved:")
                            Text(String(totalWeight) + " lbs.").bold()
                        }
                        
                        
                    }.listStyle(.inset)
                }.padding(.top, 20)
            }.padding(.top, 20)
            
            Text("''" + quote + "''").padding([.top, .leading, .trailing], 20).italic().multilineTextAlignment(.center)
            Text("- Arnold Schwarzenegger").bold().padding(.top, 5)
            
            Spacer()
            
            
            
        }.padding(.top, 30)
    }
}

struct WorkoutFinishedView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutFinishedView(title: "Chest Day", exerciseCount: 3, sets: 12, duration: "00:22:13", totalWeight: 1132)
    }
}
