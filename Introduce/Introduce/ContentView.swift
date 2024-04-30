//
//  ContentView.swift
//  Introduce
//
//  Created by h.kento on 2024/04/29.
//

import SwiftUI

struct ContentView: View{
    var body: some View {
        Text("Wednesday")
            .font(Font.largeTitle)
        HStack{
            Image(systemName: "clock.fill")
                .font(.title2)
            Text("1時間ごとの天気予報")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(.semibold)
        }
        ScrollView([.horizontal]) {
            HStack {
                DayForecast(day: "Wed", isRainy: false, high: 70, low: 50, time: "0時", cloud: true, degree: 10)
                
                DayForecast(day: "Wed", isRainy: true, high: 60, low: 40, time: "1時", cloud: false, degree: 22)
                
                DayForecast(day: "Wed", isRainy: false, high: 25, low: 10, time: "2時", cloud: false, degree: 23)
                DayForecast(day: "Wed", isRainy: false, high: 25, low: 10, time: "3時", cloud: false, degree: 25)
                DayForecast(day: "Wed", isRainy: false, high: 25, low: 10, time: "4時", cloud: true, degree: 23)
                DayForecast(day: "Wed", isRainy: false, high: 25, low: 10, time: "5時", cloud: false, degree: 23)
                DayForecast(day: "Wed", isRainy: false, high: 25, low: 10, time: "6時", cloud: false, degree: 23)
                    //.frame(maxHeight: .infinity)
            }
        }
        Temperature(high: 25, low: 10)
    }
}
    
    #Preview {
        ContentView()
    }


struct DayForecast: View {
    let day: String
    let isRainy: Bool
    let high: Int
    let low: Int
    let time: String
    let cloud: Bool
    let degree: Int
    
    var iconName: String{
        if isRainy{
            return "cloud.rain.fill"
        } else if cloud {
            return "cloud.fill"
        } else {
            return "sun.max.fill"
        }
    }
    
    var iconColor: Color{
        if isRainy{
            return Color.blue
        } else if cloud {
            return Color.gray
        }else {
            return Color.orange
        }
    }
        
    var body: some View {
        VStack {
            Text(time)
                .foregroundStyle(Color.black)
                .font(Font.headline)
            //Text(day)
                //.font(Font.headline)
            Image(systemName: iconName)
                .foregroundColor(iconColor)
                .frame(maxWidth: 20, maxHeight: 20)
                .aspectRatio(1, contentMode: .fit)
                .font(Font.largeTitle)
                .padding(5)
            Text("気温: \(degree)ºc")
            //Text("最高: \(high)ºc")
                //.fontWeight(Font.Weight.semibold)
            //Text("最低: \(low)ºc")
                //.fontWeight(Font.Weight.medium)
                //.foregroundStyle(Color.secondary)
        }
        .padding()
    }
}

struct Temperature: View {
    let high: Int
    let low: Int
    
    var body: some View {
        HStack {
            Text("最高: \(high)ºc")
                .font(Font.largeTitle)
                .foregroundStyle(Color.red)
                .padding()
            Text("最低: \(low)ºc")
                .font(Font.largeTitle)
                .foregroundStyle(Color.blue)
        }
    }
}
