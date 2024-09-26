//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by Anthony Candelino on 2024-09-22.
//

import SwiftData
import SwiftUI

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
