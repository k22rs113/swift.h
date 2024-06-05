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
//    @State private var list: [(isCheck: Bool, Tasks: String)] = []
    
    @State private var nameAdd = ""
    @State private var allCheck = false
    
    var body: some View {
        VStack {
            VStack(spacing: 8) {
                Image(systemName: "rectangle.and.pencil.and.ellipsis")
                    .font(.title)
                    .foregroundStyle(.yellow)
                // .symbolRenderingMode(.hierarchical)
                HStack(spacing: 32){
                    Button(action: {
                        allCheck.toggle()
                        list = list.map { todo in
                            var reTodo = todo
                            reTodo.isCheck = allCheck
                            return reTodo
                        }
                     //   save()
                    },
                           label: {
                        Image(systemName: allCheck ?
                              "checkmark.circle.fill" : "circle")
                        .font(.title)
                        .foregroundColor(.yellow)
                    })
                    
                    
                    Text("ToDoList")
                        .foregroundStyle(.yellow)
                        .font(.largeTitle)
                        .bold()
                        .italic()
                        .underline()
                    Button( action: {
                        list.removeAll(where: {$0.isCheck == true})
                        if allCheck == true {
                            allCheck.toggle()
                        }
                       // save()
                    },
                            label: {
                        Image(systemName: "trash.circle")
                            .font(.largeTitle)
                            .foregroundColor(.yellow)
                    })
                    //.buttonStyle(.borderedProminent)
                }
            }
            
            TextField("タスクを入力", text: $nameAdd)
                .overlay(
                    RoundedRectangle(cornerSize: CGSize(width: 8.0, height: 8.0))
                        .stroke(Color.yellow, lineWidth: 6.0)
                        .padding(-2.0)
                )
               // .autocorrectionDisabled()
                .textFieldStyle(.roundedBorder)
                .frame(width: 256)
                .onSubmit {
                    if !nameAdd.isEmpty {
                        list.append(ToDoList(isCheck: false, Tasks: nameAdd))
//                        list.append((isCheck: false, Tasks: nameAdd))
                        nameAdd = ""
                        
                        allCheck = false
                      //  save()
                    }
                }
            
            List {
                ForEach(list.indices, id: \.self) {index in
                    HStack{
                        Image(systemName: list[index].isCheck ? "checkmark.circle.fill" : "circle")
                            .foregroundStyle(list[index].isCheck ? .green : .black)
                        Button( action: {
                            list[index].isCheck.toggle()
                       //     save()
                        },
                                label: {
                            if list[index].isCheck {
                                Text(list[index].Tasks)
                                    .foregroundColor(.black)
                                    .strikethrough(color:.green)
                            } else {
                                Text(list[index].Tasks)
                                    .foregroundColor(.black)
                            }
                        })
                    }
                }
                .onMove(perform: move)
                //.deleteDisabled(true)
            }
            .clipShape(RoundedRectangle(cornerRadius: 90))
            .padding()
            .environment(\.editMode, .constant(.active))
        }
        .padding()
        .background(Color.black)
        .onAppear(){
            if let todosData = UserDefaults.standard.data(forKey: "TodoList_Key"),
               let decodedTodos = try? JSONDecoder().decode([ToDoList].self, from: todosData) {
                list = decodedTodos
            }
        }
//        .onAppear(){
//                    guard let defaultItem = UserDefaults.standard.array(forKey: "todo") as? [Bool,String] else{return}
//                         list = defaultItem
//                }

    }
    
    private func move(from source: IndexSet, to destination: Int) {
        list.move(fromOffsets: source, toOffset: destination)
        //save()
    }
    
    private func save() {
        if let jsonValue = try? JSONEncoder().encode(list)  {
            UserDefaults.standard.set(jsonValue, forKey: "TodoList_Key")
        }
    }
}

#Preview {
    todoView()
}
