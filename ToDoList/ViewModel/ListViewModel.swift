//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Виталий Багаутдинов on 28.08.2024.
//

import Foundation

/*
 CRUD FUNCTIONS
 
 Create
 Read
 Update
 Delete
 
 */

class ListViewModel: ObservableObject {
    
    @Published var items: [Punct] = [] {
        didSet {
            saveItem()
        } //Каждый раз когда мы взаимодействуем с массивом items вызывается didset и запускается код внутри него, т.е. сохранение элементов списка
    }
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    } //запускает эту функцию, чтобы данные вывелись на экран самостоятельно
    
    func getItems() {
        // ДАННЫЕ КОТОРЫЕ ДОБАВЛЯЮТСЯ В РУЧНУЮ
        
//        let newItems = [
//            Punct(title: "Тренировка", state: false),
//            Punct(title: "Учеба", state: true)
//        ]
//        items.append(contentsOf: newItems)
        
        // ДАННЫЕ КОТОРЫЕ ДОБАВЛЯЕТ ПОЛЬЗОВАТЕЛЬ ВНУТРИ ПРИЛОЖЕНИЯ
        
        guard 
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let saveItems = try? JSONDecoder().decode([Punct].self, from: data)
        else { return }
        
        self.items = saveItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = Punct(title: title, state: false)
        items.append(newItem)
    }
    
    func updateItem(item: Punct) {
        
//        if let index = items.firstIndex { existingItem in
//            return existingItem.id == item.id
//        } {
//            
//        }
        
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateState()
        }
        
    }
    
    func saveItem() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
}


