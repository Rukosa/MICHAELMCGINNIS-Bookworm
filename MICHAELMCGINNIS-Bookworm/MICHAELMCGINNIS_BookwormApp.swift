//
//  MICHAELMCGINNIS_BookwormApp.swift
//  MICHAELMCGINNIS-Bookworm
//
//  Created by Michael Mcginnis on 3/28/22.
//

import SwiftUI

@main
struct MICHAELMCGINNIS_BookwormApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
