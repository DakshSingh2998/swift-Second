//
//  SecondApp.swift
//  Second
//
//  Created by Daksh on 19/02/35.
//

import SwiftUI

@main
struct SecondApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
