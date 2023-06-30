//
//  ContentView.swift
//  EgoLyfter
//
//  Created by Joel on 6/28/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            TabView{
                TabOneView()
                    .tabItem{
                        Image(systemName: "house")
                        Text("Tab One")
                    }
                TabTwoView()
                    .tabItem{
                        Image(systemName: "person")
                        Text("Tab Two")
                    }
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
