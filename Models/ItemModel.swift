//
//  ItemModel.swift
//  ToDoList
//
//  Created by Admin on 29/07/2564 BE.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    var isCompleted: Bool = false
    let parentCategoryID: String
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool = false, parentCategoryID: String) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.parentCategoryID = parentCategoryID
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted, parentCategoryID: parentCategoryID)
    }
    
}
