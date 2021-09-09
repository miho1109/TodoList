//
//  CategoryModel.swift
//  ToDoList
//
//  Created by Admin on 29/07/2564 BE.
//

import Foundation

struct CategoryModel: Identifiable, Codable {
    let id: String
    let title: String
    
    init(id: String = UUID().uuidString, title: String) {
        self.id = id
        self.title = title
    }
    
    func updateCompletion() -> CategoryModel {
        return CategoryModel(id: id, title: title)
    }
    
}
