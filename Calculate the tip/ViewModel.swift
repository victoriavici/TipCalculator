//
//  ViewModel.swift
//  Calculate the tip
//
//  Created by Victoria Galikova on 25/03/2023.
//

import Foundation

@MainActor public class ViewModel: ObservableObject {
    
    @Published var totalInput: Double? 
    @Published var isChecked1 = false
    @Published var isChecked2 = false
    @Published var isChecked3 = false
    @Published var myChoice: Tip?
    @Published var tip = 0.0
    @Published var roundTip = false
    
    func setTip() {
        if let myChoice = myChoice {
            tip = (totalInput ?? 0)! * myChoice.value
            } else {
                tip = 0.0
            }
        if roundTip {
            tip.round()
        }
    }
}
