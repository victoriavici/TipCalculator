//
//  ViewModel.swift
//  Calculate the tip
//
//  Created by Victoria Galikova on 25/03/2023.
//

import Foundation

@MainActor public class ViewModel: ObservableObject {
    
    // okej ale nesplna to to co by vm mal splnat, netreba sa bat kodit si akcie a reacie
    // mimo akcii by si nemala menit vnutorny stav vm, mimo toho ze tym porusujes uapuzdrenie moze vznikat nekonzistencia
    
    // mozes kludene pridat dve extension kde jedna bude public a jedna private. public extension bude obsahovat akcie.
    // tie moze volat napriklad view ako ten changeChoise spomenuty v ContentView
    // privatna extensia bude obsahovat reakcie to znamena ze veci co budu menit stav premennych objektu
        
    // ked chces byt strasne super a mat bezpecny kod mozes pridat private(set) 
    @Published private(set) var totalInput: Double?
    @Published private(set) var isChecked1 = false
    @Published private(set) var isChecked2 = false
    @Published private(set) var isChecked3 = false
    @Published private(set) var myChoice: Tip?
    @Published private(set) var tip = 0.0
    @Published private(set) var roundTip = false
    
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

// pre priklad nezarucujem sa za funkcnost
extension ViewModel {
    
    func changeChoise(_ choise: Tip) {
        myChoice = choise
        choiseChanged()
    }
    
    func changeInput(_ input: Double) {
        totalInput = input
    }
    
    func changeRoundTip(value: Bool) {
        roundTip = value
    }
        
}

private extension ViewModel {
    
    func choiseChanged() {
        switch myChoice {
        case .amazing:
            isChecked1 = true
            isChecked2 = false
            isChecked3 = false
            
        case .good:
            isChecked1 = false
            isChecked2 = true
            isChecked3 = false
            
        case .okay:
            isChecked1 = false
            isChecked2 = false
            isChecked3 = true
            
        default:
            break
        }
    }
    
}
