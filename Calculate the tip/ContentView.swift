//
//  ContentView.swift
//  Calculate the tip
//
//  Created by Victoria Galikova on 21/03/2023.
//

import SwiftUI

struct ContentView: View {
 
    @ObservedObject var viewModel = ViewModel()

    // tu je binding pre textField
    var texfielfBingding: Binding<Double?> {
        .init(
            get: { viewModel.totalInput },
            set: { newValue in viewModel.changeInput(newValue ?? 0) }
        )
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                //zbytocna medzera
                
                // no a pretoze to chceme pekne a bezpecne a do vm sme pridali k vsetkemu get only teraz miesto $viewModel.totalInput msis pouzit nasledovne
                // inicializujeme si custom binding, ja viem znie to ako pekne zaklinadlo ale neboj nebude to boliet, akurat si nadefinujeme custom get a set akciu kde v get budeme brat nejake data z vm a v set budeme posielat vykonanu zmenu ako akciu do vm
                TextField(
                    "Cost of service",
                    value: texfielfBingding,
                    format: .number
                )
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                Text("How was the service?")
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                VStack(alignment: .leading) {
                    // { _ in } pri sete znanema ze sa bude set bingingu ignorovat ;)
                    CheckView(
                        isChecked: .init(
                            get: { viewModel.isChecked1 },
                            set: { _ in }
                        ),
                        title: "Amazing (20%)",
                        onAction: {
                            // menis viewModel ale preco tu
                            // lepsie by bolo pridat do vm akciu ktora ti dovoli zmenit choise a vyriesi aj ostatnu logiku vo vnutri vm
                            // ty by si potom len poslala ze viewModel.changeChoise(.nejakaChoise) a isChecked by si vedelna nastavit v tele tej akcie napriklad s pomocou switcha
//                            viewModel.isChecked2 = false
//                            viewModel.isChecked3 = false
//                            viewModel.myChoice = .amazing
                            viewModel.changeChoise(.amazing)
                        }
                    )
                    CheckView(
                        isChecked: .init(
                            get: { viewModel.isChecked2 },
                            set: { _ in }
                        ),
                        title: "Good (18%)",
                        onAction: {
//                            viewModel.isChecked1 = false
//                            viewModel.isChecked3 = false
//                            viewModel.myChoice = .good
                            viewModel.changeChoise(.good)
                        }
                    )
                    CheckView(
                        isChecked: .init(
                            get: { viewModel.isChecked3 },
                            set: { _ in }
                        ),
                        title: "Okay (15%)",
                        onAction: {
//                            viewModel.isChecked2 = false
//                            viewModel.isChecked1 = false
//                            viewModel.myChoice = .okay
                            viewModel.changeChoise(.okay)
                    })
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Toggle(
                    "Round up tip?",
                    isOn: .init(
                        get: { viewModel.roundTip },
                        set: { newValue in viewModel.changeRoundTip(value: newValue) }
                    )
                )
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
                
                // toto tu spati kludne to mozes dat hore ako computed property do hlavicky kde deklarujes premenne
                let formattedTip = String(format: "%.2f€", viewModel.tip)
                Text("Tip amount: \(formattedTip)").padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.light)
    }
}


