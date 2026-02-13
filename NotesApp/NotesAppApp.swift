//
//  NotesAppApp.swift
//  NotesApp
//
//  Created by Brandon Watson on 2/12/26.
//

import SwiftUI

@main
struct NotesAppApp: App {
    @StateObject private var viewModel = NotesViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
