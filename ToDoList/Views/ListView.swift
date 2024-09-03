//
//  ListView.swift
//  ToDoList
//
//  Created by Виталий Багаутдинов on 22.08.2024.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeInOut))
                //после удаления - плавно появится на экране
            }
            else {
                List {
                    ForEach(listViewModel.items) {item in
                        ListRowView(title: item)
                            .onTapGesture {
                                withAnimation(.easeIn) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("ToDoList📝")
            .navigationBarItems(
                leading: EditButton().disabled(listViewModel.items.isEmpty ? true : false).opacity(listViewModel.items.isEmpty ? 0 : 1),
                trailing:
                    NavigationLink("Add", destination: AddView())
            )
    }

}

#Preview {
    NavigationView {
        ListView()
    }
    .environmentObject(ListViewModel())
}
