//
//  DataModel.swift
//  NotesApp
//
//  Created by Brandon Watson on 2/12/26.
//

import Foundation

struct Note: Codable, Identifiable {
    var id = UUID()
    var title: String
    var isCompleted: Bool
    var content: String
    
    init(title: String, isCompleted: Bool = false, details: String = "") {
        self.title = title
        self.isCompleted = isCompleted
        self.content = details
    }
}
