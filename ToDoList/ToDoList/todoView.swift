//
//  todoView.swift
//  ToDoList
//
//  Created by h.kento on 2024/05/09.
//

import SwiftUI

struct ToDoList:Codable {
    var isCheck:Bool
    var Tasks:String
}


struct todoView: View {
    @State private var list: [ToDoList] = []
    @State private var nameToAdd = ""
    @State private var check = [true,false]
    @State private var allCheck = false

    var body: some View {
        VStack {
            VStack(spacing: 8) {
                Image(systemName: "rectangle.and.pencil.and.ellipsis")
                    .font(.title)
                    .foregroundStyle(.pink)
                   // .symbolRenderingMode(.hierarchical)
                HStack{
                    Button(action: {
                        allCheck.toggle()
                        list[0].isCheck = allCheck
                        check = check.map{_ in allCheck}
                    },
                           label: {
                        Image(systemName: allCheck ?
                              "checkmark.circle.fill" : "circle")
                        .font(.title)
                        .foregroundColor(.pink)
                    })
                    
                    
                    Text("ToDoList")
                        .foregroundStyle(.pink)
                        .font(.largeTitle)
                        .bold()
                        .italic()
                        .underline()
                    Button( action: {
                        list.removeAll(where: {_ in true})
                        //list.removeAll()
//                        UserDefaults.standard.setValue(self.list, forKey: "todolist")
                    },
                            label: {
                        Text("削除")
                            .font(.title3)
                    })
                    .buttonStyle(.borderedProminent)
                }
            }
            
            TextField("タスクを入力", text: $nameToAdd)
                .overlay(
                        RoundedRectangle(cornerSize: CGSize(width: 8.0, height: 8.0))
                        .stroke(Color.pink, lineWidth: 4.0)
                        .padding(-2.0)
                )
                .autocorrectionDisabled()
                .textFieldStyle(.roundedBorder)
                .frame(width: 300)
                .foregroundColor(.pink
                )
                .onSubmit {
                    if !nameToAdd.isEmpty {
                        list.append(ToDoList(isCheck: false, Tasks: nameToAdd))
                        nameToAdd = ""
                    }
                }
            
            List {
                ForEach(list.indices, id: \.self) {index in
                    //1...5
                    HStack{
                        Image(systemName: list[index].isCheck ? "checkmark.circle.fill" : "circle")
                        Button( action: {
                            list[index].isCheck.toggle()
                        },
                                label: {
                            if list[index].isCheck {
                                Text(list[index].Tasks)
                                    .foregroundColor(.black)
                                    .strikethrough()
                            } else {
                                Text(list[index].Tasks)
                                    .foregroundColor(.black)
                            }
                        })
                        
                    }
                }
                .onMove(perform: move)
                .onDelete(perform: {index in
                    self.list.remove(atOffsets: index)
                })
                //.deleteDisabled(true)
            }
            .clipShape(RoundedRectangle(cornerRadius: 90))
            .padding()
            //.environment(\.editMode, .constant(.active))
            EditButton()
        }
        .padding()
        .background(Color.green)
//        .onAppear(){
//            guard let defaultItem = UserDefaults.standard.array(forKey: "todolist") as? [ToDoList]
//            else {return}
//            self.list = defaultItem
//        }
    }
    private func move(from source: IndexSet, to destination: Int) {
        list.move(fromOffsets: source, toOffset: destination)
    }
}

#Preview {
    todoView()
}

