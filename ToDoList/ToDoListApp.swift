//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Виталий Багаутдинов on 22.08.2024.
//

import SwiftUI

/*
 MVVM Architecture
 
 Model - data poin
 View - UI
 ViewModel - manages Models for View
 
 */

@main
struct ToDoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle()) //для айпада
            .environmentObject(listViewModel)
        }
    }
}
