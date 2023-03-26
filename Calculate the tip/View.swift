//
//  View.swift
//  Calculate the tip
//
//  Created by Victoria Galikova on 25/03/2023.
//

import SwiftUI


struct CheckView: View {
    
    @Binding var isChecked: Bool
    var title: String
    
    var onAction: () -> Void
    // medzera navyse
    
    var body: some View {
        VStack {
            Button {
                // ak chces zmenit hodnotu bool na opacnu swift ma na to operator toggle: someBool.toggle()
                isChecked = !isChecked
                onAction()
            }label:{
                HStack{
                    Image(systemName: isChecked ? "checkmark.square": "square")
                        .foregroundColor(.green)
                        
                    Text(title)
                        .foregroundColor(.black)
                     // medzera navyse
                }
            }
        }
        .frame(alignment: .leading)
        .padding(.horizontal)
    }
    // tu chybala medzera
}
