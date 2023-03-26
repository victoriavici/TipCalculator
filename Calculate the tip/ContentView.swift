//
//  ContentView.swift
//  Calculate the tip
//
//  Created by Victoria Galikova on 21/03/2023.
//

import SwiftUI

struct ContentView: View {
 
    @ObservedObject var viewModel = ViewModel()

    var body: some View {
        GeometryReader { proxy in
            VStack {
                // sem sa nedava medzera
                TextField("Cost of service", value: $viewModel.totalInput, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                Text("How was the service?")
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                VStack(alignment: .leading) {
                    CheckView(isChecked: $viewModel.isChecked1,
                        title: "Amazing (20%)",
                        onAction: { 
                         // zbytocna logika tu, isChacked property sa daju uoravovat priamo vo viewModel, staci pridat akciu ze change Choise ktora sa o to postara
                         viewModel.isChecked2 = false
                                    viewModel.isChecked3 = false
                                    viewModel.myChoice = .amazing
                    })
                    CheckView(isChecked: $viewModel.isChecked2,
                        title: "Good (18%)",
                        onAction: { viewModel.isChecked1 = false
                                    viewModel.isChecked3 = false
                                    viewModel.myChoice = .good
                    })
                    CheckView(isChecked: $viewModel.isChecked3,
                        title: "Okay (15%)",
                        onAction: { viewModel.isChecked2 = false
                                    viewModel.isChecked1 = false
                                    viewModel.myChoice = .okay
                    })
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Toggle("Round up tip?", isOn: $viewModel.roundTip)
                    .padding()
                
                Button {
                    viewModel.setTip()
                } label: {
                    Text("Calculate")
                    .font(.system(size: 25, weight: .bold))
                    .padding(10)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(15)
                    .border(Color.white, width: 3)
                    .frame(alignment: .center)
                    
                }
                
                // toto nema co robit vo vnuty body vytiahnut von
                let formattedTip = String(format: "%.2f€", viewModel.tip)
                Text("Tip amount: \(formattedTip)").padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
     // nezabezpeci ti zmenu farebnej schemy v celej apke, to treba urobit inak
        ContentView().preferredColorScheme(.light)
    }
}


