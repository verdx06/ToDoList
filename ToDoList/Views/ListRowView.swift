//
//  ListRowView.swift
//  ToDoList
//
//  Created by Виталий Багаутдинов on 22.08.2024.
//

import SwiftUI

struct ListRowView: View {
    
    let title: Punct
    
    var body: some View {
        HStack {
            Image(systemName: title.state ? "checkmark.circle" : "circle")
                .foregroundColor(title.state ? .green : .red)
            Text(title.title)
            Spacer()
        }
    }
}


#Preview {
    ListRowView(title: .pip)
}

