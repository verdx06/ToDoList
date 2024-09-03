//
//  AddView.swift
//  ToDoList
//
//  Created by Виталий Багаутдинов on 22.08.2024.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var TextFieldChecked = false
    @State var alerttitle = ""
    @State var isAlert = false
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something...", text: $textFieldText)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                if TextFieldChecked {
                    Text("Напишите более 3-х символов")
                        .foregroundColor(.red)
                        .font(.caption)
                        .frame(alignment: .leading)
                }
                
                Button {
                    if checkField() {
                        if checkItemsAgain(item: textFieldText) {
                            listViewModel.addItem(title: textFieldText)
                            presentationMode.wrappedValue.dismiss()
                        }
                        TextFieldChecked = false
                    }
                    else {
                        TextFieldChecked = true
                    }
                } label: {
                    Text("Save")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

            }
            .alert(isPresented: $isAlert, content: {
                getAlert()
            })
            .padding()
        }
        .navigationTitle("Add an Item")
    }
    
    func checkItemsAgain(item: String) -> Bool {
        if listViewModel.items.firstIndex(where: {$0.title == item}) == nil {
            return true
        }
        alerttitle = "Такой пункт уже существует"
        isAlert.toggle()
        return false
    }
    
    func checkField() -> Bool {
        if textFieldText.count < 3 {
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alerttitle))
    }
    
}

#Preview {
    NavigationView {
        AddView()
    }
    .environmentObject(ListViewModel())
}
