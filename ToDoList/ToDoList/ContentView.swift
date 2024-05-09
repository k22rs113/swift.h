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
            
            todoView()
                .tabItem{
                    Label("todo", systemImage: "1.circle")
                }
                .tag(1)
            
            mapView()
                .tabItem{
                    Label("map", systemImage: "2.circle")
                }
                .tag(2)
        }
        
    }
}

#Preview {
    ContentView()
}

