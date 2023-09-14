//
//  ContentView.swift
//  Assignment3
//
//  Created by Morgan Pence on 9/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomePageView()
                .tabItem {
                    Label("Home", systemImage: "sparkles")
                }
            ProfilePageView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HomePageView: View {
    @State var isOn: Bool = false
    

    var body: some View {
        ZStack{
            LinearGradient(colors: [.green,.white], startPoint: .topLeading, endPoint: .bottomTrailing)
            
            
            VStack{
                Text("Hello, Morgan!")
                    .fontWeight(.bold)
                Text("Welcome to your home page")
                    .foregroundColor(.blue)
                
                
            }
            .padding()
            .background(.ultraThinMaterial, in:RoundedRectangle(cornerRadius: 20, style:.continuous))
            
        }
        
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct ProfilePageView: View {
    @State private var showingAlert = true
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            VStack(content: {
                Text("Profile Page")
                NavigationLink("Show Confidential Information"){
                    //Text("Making it hard to get to this info ;)")
                    Button("click here for it") {
                                showingSheet.toggle()
                            }
                            .sheet(isPresented: $showingSheet) {
                                SheetView()
                            }
                }
                /*Button("Show Alert") {
                    showingAlert = true
                }*/
                .alert("Understand you are accessing personal and confidential information", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) { }
                }
                
            })
            .padding()
            .navigationBarTitle("Profile Page")
        }
    }
}

struct SheetView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack{
            Button("Press to close sheet") {
                dismiss()
            }
            .font(.title)
            .padding()
            .background(.ultraThinMaterial, in:RoundedRectangle(cornerRadius: 20, style:.continuous))
            Text("Here's that info!")
            Image("orbImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            
        }
            
    }
}
