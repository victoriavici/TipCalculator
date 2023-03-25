//
//  Model.swift
//  Calculate the tip
//
//  Created by Victoria Galikova on 25/03/2023.
//

import Foundation

enum Tip: String {
    case amazing = "Amazing"
    case good = "Good"
    case okay = "Okay"
    
    var value: Double {
           switch self {
           case .amazing:
               return 0.20
           case .good:
               return 0.18
           case .okay:
               return 0.15
           }
       }
}
