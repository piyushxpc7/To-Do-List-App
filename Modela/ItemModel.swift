//
//  ItemModel.swift
//  MVVM To_Do
//
//  Created by Chandra on 05/02/24.
//

import Foundation
struct ItemModel : Identifiable, Codable{
    var id = UUID().uuidString
    let title: String
    let iscompleted: Bool
    
    init(id : String = UUID().uuidString , title : String, isCompleted : Bool){
        self.id = id
        self.title = title
        self.iscompleted = isCompleted
    }
    func updateCompletion()->ItemModel{
        return ItemModel(id: id, title: title, isCompleted: !iscompleted)
    }
    
}

