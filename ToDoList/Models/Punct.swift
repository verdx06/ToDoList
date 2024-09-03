//
//  Punct.swift
//  ToDoList
//
//  Created by Виталий Багаутдинов on 27.08.2024.
//

import Foundation

struct Punct: Identifiable, Codable {
    let id: String
    let title: String
    let state: Bool
    
    init(id: String = UUID().uuidString ,title: String, state: Bool) {
        self.id = id
        self.title = title
        self.state = state
    }
    
    func updateState() -> Punct {
       return Punct(id: id, title: title, state: !state)
    }
}

extension Punct {
    
    static var pip: Punct {
        .init(title: "koko", state: true)
    }
}
