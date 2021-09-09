//
//  CategoryViewModel.swift
//  ToDoList
//
//  Created by Admin on 29/07/2564 BE.
//

import Foundation

class CategoryViewModel: ObservableObject {
    
    @Published var categories: [CategoryModel] = [] {
        didSet {
            saveCategories()
        }
    }
    
    let categoriesKey: String = "categories_list"
    
    init() {
        getCategories()
    }
    
    func getCategories() {
        guard
            let data = UserDefaults.standard.data(forKey: categoriesKey),
            let savedCategories = try? JSONDecoder().decode([CategoryModel].self, from: data)
        else { return }

        self.categories = savedCategories
    }
    
    func deleteCategory(indexSet: IndexSet) {
        categories.remove(atOffsets: indexSet)
    }
    
    func moveCategory(from: IndexSet, to: Int) {
        categories.move(fromOffsets: from, toOffset: to)
    }
    
    func addCategory(category: CategoryModel) {
        categories.append(category)
    }
    
    func updateCategory(category: CategoryModel) {
        if let index = categories.firstIndex(where: { $0.id == category.id }) {
            categories[index] = category.updateCompletion()
        }
    }
    
    func saveCategories() {
        if let encodedData = try? JSONEncoder().encode(categories) {
            UserDefaults.standard.set(encodedData, forKey: categoriesKey)
        }
    }
    
}
