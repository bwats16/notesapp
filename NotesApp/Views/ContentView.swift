//
//  ContentView.swift
//  NotesApp
//
//  Created by Brandon Watson on 2/12/26.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: NotesViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.notes) { note in
                    NavigationLink {
                        NoteDetailView(viewModel: viewModel, note: note)
                    } label: {
                        VStack(alignment: .leading, spacing: 6) {
                            HStack {
                                Text(note.title.isEmpty ? "Untitled" : note.title)
                                    .font(.headline)
                                    .strikethrough(note.isCompleted)
                                
                                Spacer()
                                
                                if note.isCompleted {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundStyle(.green)
                                }
                            }
                            
                            Text(note.content)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                                .lineLimit(1)
                                .strikethrough(note.isCompleted)
                        }
                        .padding(.vertical, 6)
                    }
                }
                .onDelete(perform: viewModel.deleteNotes)
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Notes")
            .navigationBarTitleDisplayMode(.large)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        AddEditNoteView(viewModel: viewModel, noteToEdit: nil)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            })
        }
    }
}
#Preview {
  
   
}
