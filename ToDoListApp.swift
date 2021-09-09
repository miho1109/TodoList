//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Admin on 29/07/2564 BE.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject var listViewModel: ItemViewModel = ItemViewModel()
    @StateObject var categoryViewModel: CategoryViewModel = CategoryViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                CategoryListView()
            }
            .environmentObject(listViewModel)
            .environmentObject(categoryViewModel)
        }
    }
}
