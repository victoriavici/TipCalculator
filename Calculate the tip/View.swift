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
    
    var onAction: ()  -> Void
    
    
    var body: some View {
        VStack {
            Button {
                isChecked = !isChecked
                onAction()
            }label:{
                HStack{
                    Image(systemName: isChecked ? "checkmark.square": "square")
                        .foregroundColor(.green)
                        
                    Text(title)
                        .foregroundColor(.black)
                        
                }
            }
        }
        .frame(alignment: .leading)
        .padding(.horizontal)
    }
}
