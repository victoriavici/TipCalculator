//
//  Calculate_the_tipApp.swift
//  Calculate the tip
//
//  Created by Sebastian Mraz on 21/03/2023.
//

import SwiftUI

@main
struct Calculate_the_tipApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: Calculate_the_tipDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
