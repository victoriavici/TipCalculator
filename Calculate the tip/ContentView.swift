//
//  ContentView.swift
//  Calculate the tip
//
//  Created by Sebastian Mraz on 21/03/2023.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: Calculate_the_tipDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(Calculate_the_tipDocument()))
    }
}
