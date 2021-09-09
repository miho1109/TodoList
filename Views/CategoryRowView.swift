//
//  CategoryRowView.swift
//  ToDoList
//
//  Created by Admin on 29/07/2564 BE.
//

import SwiftUI

struct CategoryRowView: View {
    let category: CategoryModel
    
    var body: some View {
        NavigationLink(
            destination: ItemListView(parentCategory: category),
            label: {
                Text(category.title)
                    .foregroundColor(.black)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
            })
    }
}

struct CategoryRowView_Previews: PreviewProvider {
    
    static var category1 = CategoryModel(title: "Food")
    
    static var previews: some View {
        Group {
            CategoryRowView(category: category1)
        }
        .previewLayout(.sizeThatFits)
        
    }
}
