//
//  ContentView.swift
//  EgoLyfter
//
//  Created by Joel on 6/28/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    
    
    var body: some View {
            if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
                //signed in
               accountView
                
            }else{
                LoginView()
            }
        }
    @ViewBuilder
    var accountView: some View {
        
        TabView {
            WorkoutListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            SearchView()
                .tabItem{
                    Label("Explore", systemImage: "magnifyingglass")
                }
            ProfileView()
                .tabItem{
                    Label("Account", systemImage: "person.circle")
                }
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
