//
//  ContentView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 23/03/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    var body: some View {
        VStack{
            MaterialDesignTextField($viewModel.text1,
                                    placeholder: viewModel.placeholder1,
                                    hint: $viewModel.hint1,
                                    editing: $editingTextField1,
                                    valid: $viewModel.text1Valid)
            .disableAutocorrection(true)
            .onChange(of: viewModel.text1, perform: { newValue in
                editingTextField1 = true
    //            CheckText1 = viewModel.hint1
    //            FirstName = viewModel.text1
            })
            .onTapGesture {
                editingTextField1 = true
            }
            .onSubmit {
                editingTextField1 = true
            }
            .frame(width: UIScreen.main.bounds.width - 50, height: 24.0)
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width - 50, height: 0.5)
                .foregroundColor(.gray)
        }

        
    }
    @State private var editingTextField1 = false {
        didSet {
            viewModel.validateText1()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
