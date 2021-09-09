//
//  AddView.swift
//  ToDoList
//
//  Created by Admin on 29/07/2564 BE.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ItemViewModel
    @EnvironmentObject var categoryViewModel: CategoryViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false

    let modelType: String
    let parentCategoryID: String?
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add \(modelType)")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            if modelType == "item" {
                let newItem = ItemModel(title: textFieldText, parentCategoryID: parentCategoryID!)
                print(newItem.parentCategoryID)
                listViewModel.addItem(item: newItem)
            } else {
                let newCategory = CategoryModel(title: textFieldText)
                categoryViewModel.addCategory(category: newCategory)
            }
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                AddView(modelType: "item", parentCategoryID: "123")
            }
            .preferredColorScheme(.light)
            .environmentObject(ItemViewModel())
        }
    }
}
