//
//  Fortune.swift
//  ToDoList
//
//  Created by h.kento on 2024/05/22.
//

import SwiftUI

struct Fortune: View {
    
    // おみくじの結果を格納する変数
    //@State private var number = 0
    @State private var number: [String] = ["大吉","吉","中吉","小吉","末吉","凶","大凶",]
    @State var numbers = 0
    @State var size: CGFloat = 0
    @State var rotation: Double = 0
    
    var body: some View {
        VStack {
            Spacer()
            Text("あなたの運勢")
                .font(.largeTitle)
                .bold()
                .underline()
            Spacer()
          
            ZStack {
                Image("omikuji")
                    .resizable()
                //.scaledToFit()
                
                switch numbers {
                case 1:
                    Text("大吉")
                        .font(.system(size: size))
                        .background(.white)
                        .border(Color.red, width: 10)
                        .frame(maxWidth: 300, maxHeight: 300)
                       .rotationEffect(.degrees(rotation)).animation(.spring(), value: 1)
                        .bold()
                        .foregroundStyle(.red)
                case 2 :
                    Text("吉")
                        .font(.system(size: size))
                        .background(.white)
                        .border(Color.red, width: 10)
                        .frame(maxWidth: 300, maxHeight: 300)
                        .rotationEffect(.degrees(rotation)).animation(.spring(), value: 1)
                        .bold()
                        .foregroundStyle(.red)
                    Spacer()
                case 3 :
                    Text("中吉")
                        .font(.system(size: size))
                        .background(.white)
                        .border(Color.red, width: 10)
                        .frame(maxWidth: 300, maxHeight: 300)
                        .rotationEffect(.degrees(rotation)).animation(.spring(), value: 1)
                        .bold()
                        .foregroundStyle(.red)
                    Spacer()
                case 4 :
                    Text("小吉")
                        .font(.system(size: size))
                        .background(.white)
                        .border(Color.red, width: 10)
                        .frame(maxWidth: 300, maxHeight: 300)
                        .rotationEffect(.degrees(rotation)).animation(.spring(), value: 1)
                        .bold()
                        .foregroundStyle(.red)
                    Spacer()
                case 5 :
                    Text("末吉")
                        .font(.system(size: size))
                        .background(.white)
                        .border(Color.red, width: 10)
                        .frame(maxWidth: 300, maxHeight: 300)
                        .rotationEffect(.degrees(rotation)).animation(.spring(), value: 1)
                        .bold()
                        .foregroundStyle(.red)
                    Spacer()
                case 6 :
                    Text("凶")
                        .font(.system(size: size))
                        .background(.white)
                        .border(Color.red, width: 10)
                        .frame(maxWidth: 300, maxHeight: 300)
                        .rotationEffect(.degrees(rotation)).animation(.spring(), value: 1)
                        .bold()
                        .foregroundStyle(.red)
                    Spacer()
                case 7 :
                    Text("大凶")
                        .font(.system(size: size))
                        .background(.white)
                        .border(Color.red, width: 10)
                        .frame(maxWidth: 300, maxHeight: 300)
                        .rotationEffect(.degrees(rotation)).animation(.spring(), value: 1)
                        .bold()
                        .foregroundStyle(.red)
                    Spacer()
                default:
                    Text("")
                }
            }
            Button {
                size = 0
                rotation = 0
                numbers = Int.random(in: 0..<number.count)
                withAnimation(.easeIn(duration: 1.0)){  //動かすのにかかる時間
                    size += 160
                    rotation += 6
                }
             
            } label: {
                Text("おみくじを引く")
                    .foregroundStyle(.black)
                    .frame(width: 288, height: 64)
                    .font(.largeTitle)
                    .bold()
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.red, lineWidth: 10)
                    )
                    .background(.white)
                    .padding()
            }
        }
    }
//    private func move() {
//        Text("\(number[numbers])")
//        .font(.system(size: size))
//        .foregroundStyle(.red)
//        .bold()
//        .background(.white)
//        .border(Color.red, width: 10)
//        .frame(maxWidth: 300, maxHeight: 300)
//        .rotationEffect(.degrees(rotation)).animation(.spring(), value: 1)
//    }
}

#Preview{
    Fortune()
}
