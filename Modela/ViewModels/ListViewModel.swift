//
//  ListViewModel.swift
//  MVVM To_Do
//
//  Created by Chandra on 05/02/24.
//

import Foundation
class ListViewModel: ObservableObject {
    @Published var items : [ItemModel] = []{
        didSet{
            //Any time change
            saveItems()
        }
    }
    let itemKey : String = "items_list"
    
    init(){
        getItems()
    }
    func getItems(){
    
        
            guard let data = UserDefaults.standard.data(forKey: itemKey),
                   let saveItems  = try?JSONDecoder().decode([ItemModel].self, from: data)
        else {
                // If there is no data for the specified key, return or handle the absence of data
                return
            }
        self.items = saveItems
        
        
//           let newItems = [     ItemModel(title: "1st", isCompleted: false),
//            ItemModel(title: "2nd", isCompleted: true),
//            ItemModel(title: "3rd", isCompleted: false)]
//        
//        items.append(contentsOf: newItems)
    }
    func deleteitems (indexSet : IndexSet){
        items.remove(atOffsets: indexSet)
}
    func moveItem(from: IndexSet, to : Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    func additem(title : String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    func updateitem(item : ItemModel){
        if let index = items.firstIndex(where: {
            $0.id == item.id
        })
        {
            items[index] = item.updateCompletion()
        }
            
    }
    func saveItems(){
        do {
            // Try to encode the 'items' array using JSONEncoder
            let encodedData = try JSONEncoder().encode(items)
            
            // Store the encoded data in UserDefaults with the key "items_list"
            UserDefaults.standard.set(encodedData, forKey: itemKey)
        } catch {
            // Handle the encoding error if it occurs
            print("Error encoding items: \(error)")
        }

        }
            
            
    }
