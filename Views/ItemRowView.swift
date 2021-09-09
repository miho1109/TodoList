//
//  ListRowView.swift
//  ToDoList
//
//  Created by Admin on 29/07/2564 BE.
//

import SwiftUI

struct ItemRowView: View {
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ItemRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "First item!", isCompleted: false, parentCategoryID: "123")
    static var item2 = ItemModel(title: "Second Item.", isCompleted: true, parentCategoryID: "123")
    
    static var previews: some View {
        Group {
            ItemRowView(item: item1)
            ItemRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
        
    }
}
