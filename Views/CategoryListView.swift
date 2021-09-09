//
//  CategoryListView.swift
//  ToDoList
//
//  Created by Admin on 29/07/2564 BE.
//

import SwiftUI

struct CategoryListView: View {
    @EnvironmentObject var categoryViewModel: CategoryViewModel
    @State var isNavigationBarHidden: Bool = true
    
    var body: some View {
        
        NavigationView {
            ZStack {
                if categoryViewModel.categories.isEmpty {
                    NoItemsView(parentCategoryID: nil)
                        .transition(AnyTransition.opacity.animation(.easeIn))
                } else {
                    List {
                        ForEach(categoryViewModel.categories) { category in
                            CategoryRowView(category: category)
        //                            .onTapGesture {
        //                                withAnimation(.linear) {
        //                                    categoryViewModel.updateCategory(category: category)
        //                                }
        //                            }
                        }
                        .onDelete(perform: categoryViewModel.deleteCategory)
                        .onMove(perform: categoryViewModel.moveCategory)
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Categories")
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                    NavigationLink("Add", destination: AddView(modelType: "category", parentCategoryID: nil))
                )
        }
        .navigationBarTitle("ToDoList", displayMode: .inline)
        .navigationBarHidden(self.isNavigationBarHidden)
        .onAppear {
            self.isNavigationBarHidden = self.isNavigationBarHidden
        }
    }
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CategoryListView()
        }
        .environmentObject(CategoryViewModel())
    }
}
