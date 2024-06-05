//
//  test.swift
//  ToDoList
//
//  Created by h.kento on 2024/05/23.
//

//import SwiftUI
//
//struct testView: View {
//    
//    @State var kuji: [String] = ["大吉","中吉","小吉","末吉","凶","大凶"]
//    @State var size: CGFloat = 0
//    @State var kujiNum = 0
//    @State var showing = true
//    @State var rota: Double = 0
//    var body: some View {
//        VStack{
//            Text("おみくじ")
//            Spacer()
//            Text("\(kuji[kujiNum])").font(.system(size: size)).background(Color.gray)
//                .border(Color.red, width: 7).frame(maxWidth: 500, maxHeight: 600)
//                .rotationEffect(.degrees(rota)).animation(.spring(), value: 10)
//            Spacer()
//            Button(action: {
//                size = 0
//                rota = 0
//                kujiNum = Int.random(in: 0..<kuji.count)
//                withAnimation(.easeIn(duration: 1.0)){
//                    size += 200
//                    rota += 45
//                }
//            }){
//                Text("占う").font(.largeTitle)
//            }
//        }
//    }
//}
//#Preview {
//    testView()
//}


//if number == 1 {
//    Text("大吉")
//        //.font(.system(size: 64))
//        .font(.system(size: size))
//        .border(Color.red, width: 10)
//        .frame(maxWidth: 300, maxHeight: 300)
//        .rotationEffect(.degrees(rotation)).animation(.spring(), value: 10)
//        .bold()
//        .foregroundStyle(.red)
//    Spacer()
//} else if number == 2 {
//    Text("吉")
//        .font(.system(size: size))
//        .border(Color.red, width: 10)
//        .frame(maxWidth: 300, maxHeight: 300)
//        .rotationEffect(.degrees(rotation)).animation(.spring(), value: 10)
//        .bold()
//        .foregroundStyle(.red)
//    Spacer()
//} else if number == 3 {
//    Text("中吉")
//        .font(.system(size: size))
//        .border(Color.red, width: 10)
//        .frame(maxWidth: 300, maxHeight: 300)
//        .rotationEffect(.degrees(rotation)).animation(.spring(), value: 10)
//        .bold()
//        .foregroundStyle(.red)
//    Spacer()
//} else if number == 4 {
//    Text("小吉")
//        .font(.system(size: size))
//        .border(Color.red, width: 10)
//        .frame(maxWidth: 300, maxHeight: 300)
//        .rotationEffect(.degrees(rotation)).animation(.spring(), value: 10)
//        .bold()
//        .foregroundStyle(.red)
//    Spacer()
//} else if number == 5 {
//    Text("末吉")
//        .font(.system(size: size))
//        .border(Color.red, width: 10)
//        .frame(maxWidth: 300, maxHeight: 300)
//        .rotationEffect(.degrees(rotation)).animation(.spring(), value: 10)
//        .bold()
//        .foregroundStyle(.red)
//    Spacer()
//} else if number == 6 {
//    Text("凶")
//        .font(.system(size: size))
//        .border(Color.red, width: 10)
//        .frame(maxWidth: 300, maxHeight: 300)
//        .rotationEffect(.degrees(rotation)).animation(.spring(), value: 10)
//        .bold()
//        .foregroundStyle(.red)
//    Spacer()
//} else {
//    Text("大凶")
//        .font(.system(size: size))
//        .border(Color.red, width: 10)
//        .frame(maxWidth: 300, maxHeight: 300)
//        .rotationEffect(.degrees(rotation)).animation(.spring(), value: 10)
//        .bold()
//        .foregroundStyle(.red)
//    Spacer()
//}
//
