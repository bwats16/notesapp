//
//  NoteDetailView.swift
//  NotesApp
//
//  Created by Brandon Watson on 2/12/26.
//



import SwiftUI

struct NoteDetailView: View {
    @ObservedObject var viewModel: NotesViewModel
    let note: Note

    private var currentNote: Note {
        viewModel.notes.first(where: { $0.id == note.id }) ?? note
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(currentNote.title.isEmpty ? "New Note" : currentNote.title)
                .font(.largeTitle)
                .bold()
                .strikethrough(currentNote.isCompleted)

            Text(currentNote.content.isEmpty ? "No Content" : currentNote.content)
                .font(.body)
                .strikethrough(currentNote.isCompleted)

            Spacer()

            Button {
                viewModel.toggleCompletion(note: currentNote)
            } label: {
                Text(currentNote.isCompleted ? "Mark as Incomplete" : "Mark as Complete")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .font(.headline)
            }
            .buttonStyle(.borderedProminent)
            .tint(currentNote.isCompleted ? .orange : .green)
        }
        .padding()
        .navigationTitle("Note Details")
        .navigationBarTitleDisplayMode(.large)
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    AddEditNoteView(viewModel: viewModel, noteToEdit: currentNote)
                } label: {
                    Image(systemName: "square.and.pencil")
                }
            }
        })
    }
}

#Preview {
    
}
