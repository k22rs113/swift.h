//
//  ContentView.swift
//  ToDoList
//
//  Created by h.kento on 2024/05/07.
//

import SwiftUI

struct ContentView: View {
    
    @State var selection = 1   //タブの選択項目を保持する
    
    var body: some View {
        
        TabView(selection: $selection){
            
            mapView()
                .tabItem{
                    Label("map", systemImage: "1.circle")
                }
                .tag(1)
            
            todoView()
                .tabItem{
                    Label("todo", systemImage: "2.circle")
                }
                .tag(2)
        }
        
    }
}

#Preview {
    ContentView()
}

