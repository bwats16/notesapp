//
//  DataModel.swift
//  NotesApp
//
//  Created by Brandon Watson on 2/12/26.
//

import Foundation

struct Note: Codable, Identifiable {
    let id: UUID
    var title: String
    var isCompleted: Bool
    var content: String
    
    init(id: UUID = UUID(), title: String, isCompleted: Bool = false, content: String = "") {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.content = content
    }
}
