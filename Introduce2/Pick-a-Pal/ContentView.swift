//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by h.kento on 2024/04/28.
//

import SwiftUI

struct ToDoList:Codable {
    var isCheck:Bool
    var Tasks:String
 }

struct ContentView: View {
    //@State private var names: [String] = ["Elisha", "Andre", "Jasmine", "Po-Chan"]
    @State private var list: [ToDoList] = []
    @State private var nameToAdd = ""
    //@State private var pickedName = ""
    //@State private var shouldRemovePickedName = false
    @State private var check = [true,false]
    @State private var allCheck = false
    
    
    var body: some View {
        VStack {
            VStack(spacing: 8) {
                Image(systemName: "person.3.sequence.fill")
                    .foregroundStyle(.tint)
                    .symbolRenderingMode(.hierarchical)
                HStack{
                    Button(action: {
                        allCheck.toggle()
                        check = list.map{_ in allCheck}
                        print(check)
                    },
                           label: {
                    Image(systemName: allCheck ?
                          "checkmark.circle.fill" : "circle")
                    .font(.title)
                })
                    
                    Text("To-Do-List")
                        .font(.title)
                    Button( action: {
                        //list.removeAll()
                        UserDefaults.standard.setValue(self.list, forKey: "todolist")
                    },
                            label: {
                        Text("削除")
                            .font(.title3)
                    })
                    .buttonStyle(.borderedProminent)
                }
            }
            
            TextField("タスクを入力", text: $nameToAdd)
                .autocorrectionDisabled()
                .textFieldStyle(.roundedBorder)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .onSubmit {
                    if !nameToAdd.isEmpty {
                        list.append(ToDoList(isCheck: false, Tasks: nameToAdd))
                        nameToAdd = ""
                    }
                }
            
            //            Text(pickedName.isEmpty ? " " : pickedName)
            //                .font(.title2)
            //                .bold()
            //                .foregroundStyle(.tint)
            
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
            .clipShape(RoundedRectangle(cornerRadius: 8))
            //.environment(\.editMode, .constant(.active))
            EditButton()
            
            
            //Toggle("Remove picked Name", isOn: $shouldRemovePickedName)
            
            //          Button {
            //                if let randomName = names.randomElement(){
            //                    pickedName = randomName
            //
            //                    if shouldRemovePickedName {
            //                        names.removeAll { name in
            //                            return (name == randomName)
            //                        }
            //                    }
            //                } else {
            //                    pickedName = ""
            //                }
            //            } label: {
            //                Text("Pick Random Name")
            //                    .padding(.vertical, 8)
            //                    .padding(.horizontal, 16)
            //            }
            //            .buttonStyle(.borderedProminent)
            //            .font(.title2)
        }
        .padding()
        .onAppear(){
            guard let defaultItem = UserDefaults.standard.array(forKey: "todolist") as? [ToDoList]
            else {return}
                 self.list = defaultItem
        }
    }
    private func move(from source: IndexSet, to destination: Int) {
        list.move(fromOffsets: source, toOffset: destination)
    }
}

#Preview {
    ContentView()
}



