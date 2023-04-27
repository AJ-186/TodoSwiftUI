//
//  ItemModel.swift
//  TodoList
//
//  Created by Ajinkya Adole on 25/04/23.
//

import Foundation

//Immtable Sturct
struct ItemModel : Identifiable, Codable {
    let id: String
    let title : String
    let isCompleted : Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id ,title: title, isCompleted: !isCompleted)
    }
    
}
