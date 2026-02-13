//
//  AddEditNoteView.swift
//  NotesApp
//
//  Created by Brandon Watson on 2/12/26.
//

import SwiftUI

struct AddEditNoteView: View {
    @ObservedObject var viewModel: NotesViewModel
    let noteToEdit: Note?

    @Environment(\.dismiss) private var dismiss

    @State private var title: String = ""
    @State private var content: String = ""

    var body: some View {
        Form {
            Section("Title") {
                TextField("Enter title", text: $title)
            }

            Section("Content") {
                TextEditor(text: $content)
                    .frame(minHeight: 200)
            }
        }
        .navigationTitle(noteToEdit == nil ? "Add Note" : "Edit Note")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            if let noteToEdit {
                title = noteToEdit.title
                content = noteToEdit.content
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    if let noteToEdit {
                        viewModel.updateNote(note: noteToEdit, newTitle: title, newContent: content)
                    } else {
                        viewModel.addNote(title: title, content: content)
                    }
                    dismiss()
                }
            }
        })
    }
}

#Preview {
  
}
