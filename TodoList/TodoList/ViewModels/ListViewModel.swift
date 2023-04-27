//
//  ListViewModel.swift
//  TodoList
//
//  Created by Ajinkya Adole on 26/04/23.
//

import Foundation

enum UserDefaultKey : String  {
    case listKey = "list_key"
}

//CRUD Operations basics

class ListViewModel : ObservableObject {
    
    
    //Autmaticall update as its is observed and anything is changed in this list it is goinf to call the func saveItems
    @Published var items : [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    init() {
        getItems()
    }
    
    
    func getItems(){
        //MARK:        Test Subjects
        //        let newItems = [x
        //            ItemModel(title: "This is 11st Row", isCompleted: false),
        //            ItemModel(title: "This is 22nd Row", isCompleted: true),
        //            ItemModel(title: "This is 33rd Row", isCompleted: false),
        //            ItemModel(title: "This is 44rd Row", isCompleted: true)
        //        ]
        //        items.append(contentsOf: newItems)
        
        
        //MARK:        Old Guard
//        guard let data = UserDefaults.standard.data(forKey: UserDefaultKey.listKey.rawValue) else { return }
//        guard let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data) else { return }
        
        //MARK:        New Guard can be used with Let
        guard
            let data = UserDefaults.standard.data(forKey: UserDefaultKey.listKey.rawValue),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet ,to : Int ){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title : String) {
        let newItem : ItemModel = ItemModel(title: title, isCompleted: false)
        self.items.append(newItem)
    }
    
    func updateItem(item : ItemModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            self.items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: UserDefaultKey.listKey.rawValue)
        }
    }
    
}
