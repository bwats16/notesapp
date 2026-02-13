//
//  NotesViewModel.swift
//  NotesApp
//
//  Created by Brandon Watson on 2/12/26.
//

import Foundation
import SwiftUI
internal import Combine

class NotesViewModel: ObservableObject {
    @AppStorage("notesData") private var notesData: String = ""

    @Published var notes: [Note] = [] {
        didSet {
           saveNotes()
        }
    }

    init() {
        loadNotes()
    }

    func addNote(title: String, content: String) {
        let newNote = Note(title: title, isCompleted: false, content: content)
        notes.append(newNote)
    }

    func updateNote(note: Note, newTitle: String, newContent: String) {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes[index].title = newTitle
            notes[index].content = newContent
        }
    }
    
    func toggleCompletion(note: Note) {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes[index].isCompleted.toggle()
        }
    }
    func deleteNotes(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
    }
    func saveNotes() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(notes) {
            notesData = String(data: encoded, encoding: .utf8) ?? ""
        }
    }
    func loadNotes() {
        let decoder = JSONDecoder()
        if let savedNotesData = notesData.data(using: .utf8),
           let decodedNotes = try? decoder.decode([Note].self, from: savedNotesData) {
            notes = decodedNotes
        }
    }
}

