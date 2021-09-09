//
//  ListView.swift
//  ToDoList
//
//  Created by Admin on 29/07/2564 BE.
//

import SwiftUI

struct ItemListView: View {
    @EnvironmentObject var listViewModel: ItemViewModel
    @State var isNavigationBarHidden: Bool = false
    
    let parentCategory: CategoryModel
    
    var body: some View {
        if listViewModel.items.filter ({ item in
            item.parentCategoryID == parentCategory.id
        }).isEmpty {
            NoItemsView(parentCategoryID: parentCategory.id)
                .transition(AnyTransition.opacity.animation(.easeIn))
        } else {
            NavigationView {
                ZStack {
                    List {
                        ForEach(listViewModel.items) { item in
                            ItemRowView(item: item)
                                .onTapGesture {
                                    withAnimation(.linear) {
                                        listViewModel.updateItem(item: item)
                                    }
                                }
                        }
                        .onDelete(perform: listViewModel.deleteItem)
                        .onMove(perform: listViewModel.moveItem)
                    }
                    .listStyle(PlainListStyle())
                }
                .navigationTitle("Todo List")
                .navigationBarItems(
                    leading: EditButton(),
                    trailing:
                        NavigationLink("Add", destination: AddView(modelType: "item", parentCategoryID: parentCategory.id))
                    )
            }
            .navigationBarTitle(parentCategory.title, displayMode: .inline)
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear {
                self.isNavigationBarHidden = self.isNavigationBarHidden
            }
        }
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemListView( parentCategory: CategoryModel(title: "Food"))
        }
        .environmentObject(ItemViewModel())
    }
}
